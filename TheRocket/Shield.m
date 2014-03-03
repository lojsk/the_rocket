//
//  Shield.m
//  TheRocket
//
//  Created by OdpiralniCasi on 22/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation Shield

- (id) initWithDuration:(int)theDuration andPosition:(Vector2*)thePosition
{
    self = [super init];
	if (self != nil) {
		start = 0;
        duration = theDuration;
        lifetime = [[Lifetime alloc] initWithStart:0 duration:theDuration];
        position = thePosition;
        velocity = [Vector2 zero];
        radius = 20;
        mass = 10;
        setID = [NSSet setWithObjects: [SimpleMonster class], [ZMonster class], nil];
        	}
	return self;
}

@synthesize lifetime, scene, position, radius, mass, setID, velocity;

- (BOOL) collidingWithItem:(id)item {
    return YES;
}

- (void) collidedWithItem:(id)item {
  //  [scene removeItem:self];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	if (lifetime) {
		[lifetime updateWithGameTime:gameTime];
		if (!lifetime.isAlive) {
			lifetime = nil;
            [scene removeItem:self];
		}
	}
}

@end
