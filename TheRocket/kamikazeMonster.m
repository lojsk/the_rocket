//
//  KamikazeMonster.m
//  TheRocket
//
//  Created by OdpiralniCasi on 19/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation KamikazeMonster

- (id) initWithX:(int)x andY:(int)y
{
	self = [super initWithX:x andY:y];
	if (self != nil) {
		[self addPoints];
	}
	return self;
}

@synthesize scene;

- (void) addPoints {
    [points addObject:[[StatePoints alloc] setDistnaceX:0.0f andY:300.0f withTime:1.0f]];
    [points addObject:[[StatePoints alloc] setDistnaceWithTime:2.0f]];
    [points addObject:[[StatePoints alloc] setDistnaceX:0.0f andY:1000.0f withTime:1.0f]];
}

@end
