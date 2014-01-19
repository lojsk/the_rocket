//
//  EnemyScene.m
//  TheRocket
//
//  Created by OdpiralniCasi on 11/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "EnemyScene.h"

@implementation EnemyScene

- (id) initWithScene:(id<IScene>)theScene topLimit:(float)tl andBottomLimit:(AAHalfPlane *)theLimit
{
	self = [super init];
	if (self != nil) {
        scene = theScene;
        enemyLevel = [[EnemyLevel alloc] init];
        [enemyLevel initialize];
        topLine = -tl;
        
        limit = theLimit;
        setID = [NSSet setWithObjects:[SimpleMonster class], nil];
	}
	return self;
}

@synthesize scene, setID;

- (void) updateWithGameTime:(GameTime *)gameTime {
    
    // adding enemy to scene
    if([enemyLevel.levelArray count] > 0 && topLine <= ((SimpleMonster*)[enemyLevel.levelArray objectAtIndex:0]).position.y) {
        [scene addItem:[enemyLevel.levelArray objectAtIndex:0]];
        [enemyLevel.levelArray removeObject:[enemyLevel.levelArray objectAtIndex:0]];
    }
    
    limit = [AAHalfPlane aaHalfPlaneWithDirection:limit.direction distance:limit.distance -= [Constants gameSpeed]];
    topLine  = topLine - [Constants gameSpeed];
}


@end
