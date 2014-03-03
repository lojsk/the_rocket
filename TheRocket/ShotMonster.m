//
//  ShotMonster.m
//  TheRocket
//
//  Created by OdpiralniCasi on 16/02/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation ShotMonster

- (id) initWithX:(int)x andY:(int)y
{
	self = [super initWithX:x andY:y];
	if (self != nil) {
		[self addPoints];
        currentBullet = 0;
        bulletNum = 1;
	}
	return self;
}

@synthesize scene;

- (void) addPoints {
    [points addObject:[[StatePoints alloc] setDistnaceX:0.0f andY:400.0f withTime:3.0f]];
   // [points addObject:[[StatePoints alloc] setDistnaceX:300.0f andY:-10.0f withTime:2.0f]];
   // [points addObject:[[StatePoints alloc] setDistnaceX:0.0f andY:1000.0f withTime:4.0f]];
}

- (void) setGame:(Game*)theGame {
    game = theGame;
    bullet = [[EnemyBullet alloc] initWithBulletPoint:[[BulletPoint alloc] initWithVelocity:[Vector2 vectorWithX:0 y:[Constants bulletSpeed]]] andPlayerPosition:self.position andGame:game];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    if(bullet && currentBullet < bulletNum) {
        [scene addItem:bullet];
        currentBullet++;
    }
}

- (BOOL) collidingWithItem:(id)item {
    return YES;
}

- (void) collidedWithItem:(id)item {
    //If anyone listening
    if([item isKindOfClass:[Bullet class]]) {

    } else {
        //[scene addItem:[[Explosion alloc] initWithDuration:5 andPosition:position]];
        [self.scene removeItem:self];
    }
}


@end
