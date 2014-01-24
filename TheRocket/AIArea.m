//
//  AIArea.m
//  TheRocket
//
//  Created by OdpiralniCasi on 22/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation AIArea

- (id) initWithPosition:(Vector2*)thePosition direction:(Vector2 *)theDirection andDistance:(float)theDistance
{
    self = [super init];
	if (self != nil) {
        position = thePosition;
        direction = theDirection;
        disance = theDistance;
        
        velocity = [Vector2 zero];
        radius = 20;
        mass = 10;
        setID = [NSSet setWithObjects: [SimpleMonster class], [ZMonster class], nil];
    }
	return self;
}

@synthesize position, radius, mass, setID, velocity;

- (void) updateWithGameTime:(GameTime *)gameTime {
    
}



@end
