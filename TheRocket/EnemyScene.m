//
//  EnemyScene.m
//  TheRocket
//
//  Created by OdpiralniCasi on 11/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "EnemyScene.h"

@implementation EnemyScene

- (id) initWithScene:(id<IScene>)theScene topLimit:(float)tl andBottomLimit:(AAHalfPlane *)theLimit andGame:(Game*)theGame
{
	self = [super init];
	if (self != nil) {
        scene = theScene;
        enemyLevel = [[EnemyLevel alloc] init];
        currentLevel = 1;
        [enemyLevel loadLevel:currentLevel];
        maxLevel = 2;
        topLine = -tl;
        
        limit = theLimit;
        setID = [NSSet setWithObjects:[SimpleMonster class], nil];
        game = theGame;
	}
	return self;
}

@synthesize scene, setID;

- (void) updateWithGameTime:(GameTime *)gameTime {    
    // adding enemy to scene
    if([enemyLevel.levelArray count] > 0 && topLine <= ((SimpleMonster*)[enemyLevel.levelArray objectAtIndex:0]).position.y) {
        ShotMonster *item = [[enemyLevel.levelArray objectAtIndex:0] isKindOfClass:[ShotMonster class]] ? [enemyLevel.levelArray objectAtIndex:0] : nil;
        if(item) {
            [item setGame:game];
            [scene addItem:item];
        } else {
            [scene addItem:[enemyLevel.levelArray objectAtIndex:0]];
        }
        
        [enemyLevel.levelArray removeObject:[enemyLevel.levelArray objectAtIndex:0]];
    }
    
    limit = [AAHalfPlane aaHalfPlaneWithDirection:limit.direction distance:[Constants calculateMovment:limit.distance withV:[Constants gameSpeed] andTime:gameTime.elapsedGameTime]];
    topLine  = [Constants calculateMovment:topLine withV:[Constants gameSpeed] andTime:gameTime.elapsedGameTime];
    
    // load new level if last is empty
    if([enemyLevel.levelArray count] <= 0) {
        currentLevel++;
        if(currentLevel>enemyLevel.maxLevel)
            currentLevel = 1;
        //currentLevel = 1;
        [enemyLevel loadLevel:currentLevel];
    }
}


@end
