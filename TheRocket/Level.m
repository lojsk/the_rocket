//
//  Level.m
//  FriHockey
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Level.h"
#import "Headers.TheRocket.h"

@implementation Level

- (id) initWithGame:(Game *)theGame
{
	self = [super initWithGame:theGame];
	if (self != nil) {
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
        topLine = [[line alloc] init];
        bottomLine = [[line alloc] init];
        
        AAHalfPlane *ahp = [AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionNegativeY distance:[Constants bottomEnemyLimit]];
        enemyScene = [[EnemyScene alloc] initWithScene:scene topLimit:[Constants topEnemyLimit] andBottomLimit:ahp];
        
        stage = [[World alloc] init];
	}
	return self;
}


- (void) initialize {

    // bg
    for (int i=0;i<[Constants numberOfBackgrounds];i++) {
        ((Background*)[bgs objectAtIndex:i]).position.x = 0;
        ((Background*)[bgs objectAtIndex:i]).position.y = i*700;
        [scene addItem: ((Background*)[bgs objectAtIndex:i])];
    }
    
    // switch bg
    switchBg.position.x = 0;
    switchBg.position.y = 1000;
    [scene addItem:switchBg];
    
    
    // player
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    player.position.x = screenSize.width;
	player.position.y = screenSize.height*3/2;
    [scene addItem:player];
    
    // enemy
    [scene addItem:enemyScene];
    //[enemyLevel initialize];
    
    // line
    topLine.position.y = 0;
    topLine.position.x = 0;
   // [scene addItem:topLine];
    
    bottomLine.position.y = screenSize.height*2-50;
    bottomLine.position.x = 0;
   // [scene addItem:bottomLine];
    
    // left - right line
    
    [scene addItem:[[VerticalLine alloc] initWithLimit:
					 [AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionPositiveX distance:0]]];
	[scene addItem:[[VerticalLine alloc] initWithLimit:
					 [AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionNegativeX distance:-screenSize.width*2]]];
	
    horTopLine =[[HorizontalLine alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionPositiveY distance:100]];
    [scene addItem:horTopLine];
    
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // background
    for (int i=0;i<[Constants numberOfBackgrounds];i++) {
        if(((Background*)[bgs objectAtIndex:i]).position.y > bottomLine.position.y) {
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
    topLine.position.y -= [Constants gameSpeed];
    bottomLine.position.y -= [Constants gameSpeed];
    
    // update all object wich have ICustomUpdate modul
    for (id item in scene) {
		id<ICustomUpdate> updatable = [item conformsToProtocol:@protocol(ICustomUpdate)] ? item : nil;
		
		if (updatable) {
			[updatable updateWithGameTime:gameTime];
		}
	}
}

- (void) itemAddedToScene:(id)sender eventArgs:(SceneEventArgs*)e {

}

- (void) itemRemovedFromScene:(id)sender eventArgs:(SceneEventArgs*)e {

}

@synthesize scene, player;

@end
