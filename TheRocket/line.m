//
//  line.m
//  TheRocket
//
//  Created by OdpiralniCasi on 08/12/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import "line.h"

@implementation line

- (id) init
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
        topLine = NO;
	}
	return self;
}

@synthesize position, topLine;


@end
