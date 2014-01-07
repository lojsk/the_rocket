//
//  SimpleMonster.m
//  TheRocket
//
//  Created by OdpiralniCasi on 06/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "SimpleMonster.h"

@implementation SimpleMonster

- (id) initWithX:(int)x andY:(int)y
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] initWithX:x y:y];
		velocity = [[Vector2 alloc] init];
		radius = 10;
		mass = 1;
        setID = [NSSet setWithObjects:[Bullet class], [Rocket class], nil];
	}
	return self;
}

@synthesize position, velocity, mass, radius, setID;


- (BOOL) collidingWithItem:(id)item {
	return YES;
}

- (void) collidedWithItem:(id)item {
    
}

@end
