//
//  Mallet.m
//  FriHockey
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Rocket.h"


@implementation Rocket

- (id) init
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		velocity = [[Vector2 alloc] init];
		radius = 10;
		mass = 1;
        setID = [NSSet setWithObjects:[VerticalLine class], [SimpleMonster class], nil];
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
