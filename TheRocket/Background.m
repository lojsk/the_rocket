//
//  Background.m
//  TheRocket
//
//  Created by OdpiralniCasi on 08/12/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import "Background.h"

@implementation Background

- (id) init {
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
        velocity = [[Vector2 alloc] init];
        layer = 0;
	}
	return self;
}

- (id) initWithSpeed:(float)theSpeed andLayer:(int)theLayer withPosition:(Vector2*)thePosition {
	self = [super init];
	if (self != nil) {
		position = thePosition;
        velocity = [[Vector2 alloc] initWithX:0 y:theSpeed];
        layer = theLayer;
	}
	return self;
}



@synthesize position, velocity, layer;


@end
