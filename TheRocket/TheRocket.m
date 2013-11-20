//
//  TheRocket.m
//  TheRocket
//
//  Created by OdpiralniCasi on 27/10/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import "TheRocket.h"
#import "Headers.TheRocket.h"

@implementation TheRocket

- (id) init
{
	self = [super init];
	if (self != nil) {
		graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
        
		[self.components addComponent:[[Gameplay alloc] initWithGame:self]];
		[self.components addComponent:[[FpsComponent alloc] initWithGame:self]];
	}
	return self;
}

@end
