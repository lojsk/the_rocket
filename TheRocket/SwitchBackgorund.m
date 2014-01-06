//
//  SwitchBackgorund.m
//  TheRocket
//
//  Created by OdpiralniCasi on 25/12/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import "SwitchBackgorund.h"

@implementation SwitchBackgorund

- (id) init
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
        currentLevel = 0;
	}
	return self;
}

@synthesize position, currentLevel;


@end
