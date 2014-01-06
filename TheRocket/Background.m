//
//  Background.m
//  TheRocket
//
//  Created by OdpiralniCasi on 08/12/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import "Background.h"

@implementation Background

- (id) init
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
        levelIMG = 0;
	}
	return self;
}

@synthesize position, levelIMG;


@end
