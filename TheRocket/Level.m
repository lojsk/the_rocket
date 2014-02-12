
//
//  Level.m
//  FriHockey
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Level.h"
#import "Headers.TheRocket.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

@implementation Level

- (id) initWithGame:(Game*)theGame gameplay:(Gameplay*)theGameplay;
{
	self = [super initWithGame:theGame];
	if (self != nil) {
        gameplay = theGameplay;
        
		scene = [[SimpleScene alloc] initWithGame:self.game];
		[self.game.components addComponent:scene];
        
        [scene.itemAdded subscribeDelegate:[Delegate delegateWithTarget:self Method:@selector(itemAddedToScene:eventArgs:)]];
		[scene.itemRemoved subscribeDelegate:[Delegate delegateWithTarget:self Method:@selector(itemRemovedFromScene:eventArgs:)]];
		
		player = [[Rocket alloc] init];
        bgs = [[NSMutableArray alloc] init];
        for(int i=0;i<[Constants numberOfBackgrounds];i++) {
            [bgs addObject:[[Background alloc] init]];
        }
        switchBg = [[SwitchBackgorund alloc] init];
        
        // score
        FontTextureProcessor *fontProcessor = [[FontTextureProcessor alloc] init];
        retrotype = [self.game.content load:@"Retrotype" processor:fontProcessor];
        
        Label *scoreLabel = [[Label alloc] initWithFont:retrotype text:@"friHockey" position:[Vector2 vectorWithX:160 y:10]];
        scoreLabel.horizontalAlign = HorizontalAlignCenter;
        score = [[Score alloc] initWithVelocity:[Vector2 vectorWithX:0 y:-[Constants gameSpeed]] andLabel:scoreLabel];
        
        AAHalfPlane *ahp = [AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionNegativeY distance:[Constants bottomEnemyLimit]];
        enemyScene = [[EnemyScene alloc] initWithScene:scene topLimit:[Constants topEnemyLimit] andBottomLimit:ahp];
        
        bulletScene = [[BulletScene alloc] initWithRocket:player andGame:theGame];
        
        stage = [[World alloc] init];
        
        coins = 0;
        
        // star position
        for (int i=0;i<[Constants numberOfBackgrounds];i++) {
            ((Background*)[bgs objectAtIndex:i]).position.x = 0;
            ((Background*)[bgs objectAtIndex:i]).position.y = i*700;
        }
        
        switchBg.position.x = 0;
        switchBg.position.y = 1000;
        
        CGRect screenBound = [[UIScreen mainScreen] bounds];
        CGSize screenSize = screenBound.size;
        
        player.position.x = screenSize.width;
        player.position.y = screenSize.height*2 - 200;
        
        pause = [[GameButton alloc] initWithArea:[Rectangle rectangleWithX:50 y:50 width:200 height:200]];
        
        bottomLimit = screenSize.height*2-50 + 10;
        
        leftLine = [[VerticalLine alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionPositiveX distance:0]];
        rightLine = [[VerticalLine alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionNegativeX distance:-screenSize.width*2]];
        horTopLine = [[HorizontalLine alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionPositiveY distance:100]];
        
        shield = [[Shield alloc] initWithDuration:5.0f andPosition:player.position];
	}
	return self;
}


- (void) initialize {

    // bg
    for (int i=0;i<[Constants numberOfBackgrounds];i++) {
        [scene addItem: ((Background*)[bgs objectAtIndex:i])];
    }
    
    // switch bg
    [scene addItem:switchBg];
    
    
    // player
    [scene addItem:player];
        
    // enemy
    [scene addItem:enemyScene];
    
    // bullet
    [scene addItem:bulletScene];
    
    // Pause button
    [scene addItem:pause];
    
    // score
    // total score
	[scene addItem:score];
    
    
    // left - right line
    [scene addItem:leftLine];
	[scene addItem:rightLine];
	
    [scene addItem:horTopLine];
    
    // adding start shield
    [scene addItem:shield];

}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // background
    for (int i=0;i<[Constants numberOfBackgrounds];i++) {
        if(((Background*)[bgs objectAtIndex:i]).position.y > bottomLimit) {
            ((Background*)[bgs objectAtIndex:i]).position.y -= [Constants numberOfBackgrounds] * 700;
            
            Background *b = ((Background*)[bgs objectAtIndex:i]);
            //NSLog(@"%d - %@ = %d", stage.mSwitch, [stage.worldLimit objectAtIndex:b.levelIMG], b.levelIMG);
            if(b.levelIMG<[stage.worldLimit count] && stage.mSwitch > [[stage.worldLimit objectAtIndex:b.levelIMG] integerValue]) {
                if(switchBg.currentLevel == b.levelIMG) {
                    switchBg.position.y = b.position.y + 700;
                    switchBg.currentLevel += 1;
                }
                b.levelIMG += 1;
            }
            stage.mSwitch += 1;
        }
    }
    
   
    // just for test mode
    bottomLimit = [Constants calculateMovment:bottomLimit withV:[Constants gameSpeed] andTime:gameTime.elapsedGameTime];
    
    // update all object wich have ICustomUpdate modul
    for (id item in scene) {
		id<ICustomUpdate> updatable = [item conformsToProtocol:@protocol(ICustomUpdate)] ? item : nil;
		
		if (updatable) {
			[updatable updateWithGameTime:gameTime];
		}
	}
    
    // button press
    if (pause.wasReleased) {
		GameState *newState = [[StaffMenu alloc] initWithGame:gameplay.game];
        [gameplay.theRocket pushState:newState];
    }
}

- (void) itemAddedToScene:(id)sender eventArgs:(SceneEventArgs*)e {

}

- (void) itemRemovedFromScene:(id)sender eventArgs:(SceneEventArgs*)e {
    
}


@synthesize scene, player;

@end
