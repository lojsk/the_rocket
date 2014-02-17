//
//  BulletScene.m
//  TheRocket
//
//  Created by OdpiralniCasi on 19/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation BulletScene

- (id) initWithRocket:(id<IMovable>)r andGame:(Game*)theGame
{
    self = [super init];
	if (self != nil) {
        player = r;
        game = theGame;
        bullets = [[NSMutableArray alloc] init];
        [self shotProfile2];
        lastShotTime = -100;
	}
	return self;
}

@synthesize scene;

- (void) updateWithGameTime:(GameTime *)gameTime {
    // shot
    TouchCollection *touches = [TouchPanel getState];
	if ([touches count] == 1 && lastShotTime + shotTime < gameTime.totalGameTime) {
        for(int i=0;i<[bullets count];i++) {
            [scene addItem:[[Bullet alloc] initWithBulletPoint:[bullets objectAtIndex:i] andPlayerPosition:player.position andGame:game]];
        }
        lastShotTime = gameTime.totalGameTime;
	}
}

- (void) shotProfile1 {
    shotTime = 0.1f;
    [bullets addObject:[[BulletPoint alloc] initWithVelocity:[Vector2 vectorWithX:0 y:-[Constants bulletSpeed]]]];
}

- (void) shotProfile2 {
    shotTime = 0.2f;
    [bullets addObject:[[BulletPoint alloc] initWithPosition:[Vector2 vectorWithX:-20 y:0] andVelocity:[Vector2 vectorWithX:0 y:-[Constants bulletSpeed]]]];
    [bullets addObject:[[BulletPoint alloc] initWithPosition:[Vector2 vectorWithX:20 y:0]  andVelocity:[Vector2 vectorWithX:0 y:-[Constants bulletSpeed]]]];
}

- (void) shotProfile3 {
    shotTime = 0.1f;
    [bullets addObject:[[BulletPoint alloc] initWithVelocity:[Vector2 vectorWithX:player.position.x - 200 y:-[Constants bulletSpeed]]]];
    [bullets addObject:[[BulletPoint alloc] initWithVelocity:[Vector2 vectorWithX:0 y:-[Constants bulletSpeed]]]];
    [bullets addObject:[[BulletPoint alloc] initWithVelocity:[Vector2 vectorWithX:player.position.x + 200 y:-[Constants bulletSpeed]]]];
}


@end
