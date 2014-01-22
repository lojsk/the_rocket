//
//  SimpleMonster.m
//  TheRocket
//
//  Created by OdpiralniCasi on 06/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation SimpleMonster

- (id) initWithX:(int)x andY:(int)y
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] initWithX:x y:y];
		velocity = [Vector2 vectorWithX:0.0f y:100.0f];
		radius = 10;
		mass = 1;
        setID = [NSSet setWithObjects:[Bullet class], [Rocket class], [EnemyScene class], nil];
	}
	return self;
}

@synthesize position, velocity, mass, radius, setID, scene;


- (BOOL) collidingWithItem:(id)item {
    return YES;
}

- (void) collidedWithItem:(id)item {
    if([item isKindOfClass:[Rocket class]] || [item isKindOfClass:[Bullet class]]) {
        [scene addItem:[[Explosion alloc] initWithDuration:5 andPosition:position]];
    }
    [scene removeItem:self];
}

@end
