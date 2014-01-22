//
//  BulletPoint.m
//  TheRocket
//
//  Created by OdpiralniCasi on 19/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "BulletPoint.h"

#import "Headers.TheRocket.h"

@implementation BulletPoint

@synthesize position, velocity;

-(BulletPoint*) initWithPosition:(Vector2*)thePosition andVelocity:(Vector2*)theVelocity {
    self = [super init];
	if (self != nil) {
        position = thePosition;
        velocity = theVelocity;
    }
    return self;
}

-(BulletPoint*) initWithVelocity:(Vector2*)theVelocity {
    self = [super init];
	if (self != nil) {
        position = [Vector2 vectorWithX:0 y:0];
        velocity = theVelocity;
    }
    return self;
}

@end
