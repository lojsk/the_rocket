//
//  EnemyScene.m
//  TheRocket
//
//  Created by OdpiralniCasi on 11/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "EnemyScene.h"

@implementation EnemyScene

- (id) initWithScene:(id<IScene>)theScene topLimit:(float)tl andGame:(Game*)theGame
{
	self = [super init];
	if (self != nil) {
        scene = theScene;
        enemyLevel = [[EnemyLevel alloc] init];
        currentLevel = 0;
        [enemyLevel loadLevel:currentLevel];
        topLine = -tl;
        
        game = theGame;
	}
	return self;
}

@synthesize scene, enemyLevel;

- (void) updateWithGameTime:(GameTime *)gameTime {    
    // adding enemy to scene
   /* float lastPos = 0;
    while(true) {
        if([enemyLevel.levelArray count] > 0 && topLine <= ((SimpleMonster*)[enemyLevel.levelArray objectAtIndex:0]).position.y) {
            ShotMonster *item = [[enemyLevel.levelArray objectAtIndex:0] isKindOfClass:[ShotMonster class]] ? [enemyLevel.levelArray    objectAtIndex:0] : nil;
            lastPos = ((SimpleMonster*)[enemyLevel.levelArray objectAtIndex:0]).position.y;
            if(item) {
                [item setGame:game];
                [scene addItem:item];
            } else {
                ((StateMonster*)[enemyLevel.levelArray objectAtIndex:0]).velocity.y = 0;
                [scene addItem:[enemyLevel.levelArray objectAtIndex:0]];
            }
            [enemyLevel.levelArray removeObject:[enemyLevel.levelArray objectAtIndex:0]];
        } else {
            break;
        }
    }
     */
    
    topLine  = [Constants calculateMovment:topLine withV:[Constants gameSpeed] andTime:gameTime.elapsedGameTime];
    
   // limit = [AAHalfPlane aaHalfPlaneWithDirection:limit.direction distance:[Constants calculateMovment:limit.distance withV:0 andTime:gameTime.elapsedGameTime]];
   // topLine  = [Constants calculateMovment:topLine withV:0 andTime:gameTime.elapsedGameTime];
    
    // load new level if last is empty
   /* if([enemyLevel.levelArray count] <= 0) {
        currentLevel++;
        if(currentLevel>enemyLevel.maxLevel)
            currentLevel = 6;
        [enemyLevel loadLevel:currentLevel];
    } */
}


@end
