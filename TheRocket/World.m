//
//  World.m
//  TheRocket
//
//  Created by OdpiralniCasi on 08/12/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import "World.h"

@implementation World

- (id) init
{
	self = [super init];
	if (self != nil) {
        worldIMG = 0;
        worldLimit = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:3], [NSNumber numberWithInt:6], [NSNumber numberWithInt:30], nil];
        mSwitch = 0;
	}
	return self;
}

@synthesize worldLimit, mSwitch;

@end
