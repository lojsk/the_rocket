//
//  FormationMonster.m
//  TheRocket
//
//  Created by OdpiralniCasi on 03/03/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation FormationMonster

- (id) initWithX:(int)x andY:(int)y
{
	self = [super initWithX:x andY:y];
	if (self != nil) {
		[self addPoints];
	}
	return self;
}

- (void) addPoints {
    [points addObject:[[StatePoints alloc] setDistnaceX:0.0f andY:300.0f withTime:2.0f]];
    [points addObject:[[StatePoints alloc] setDistnaceX:100.0f andY:50.0f withTime:0.5f]];
    [points addObject:[[StatePoints alloc] setDistnaceX:200.0f andY:0.0f withTime:1.0f]];
    [points addObject:[[StatePoints alloc] setDistnaceX:100.0f andY:-200.0f withTime:0.5f]];
    [points addObject:[[StatePoints alloc] setDistnaceX:0.0f andY:-200.0f withTime:0.5f]];
    [points addObject:[[StatePoints alloc] setDistnaceX:-100.0f andY:-100.0f withTime:0.5f]];
    [points addObject:[[StatePoints alloc] setDistnaceX:-100.0f andY:-0.0f withTime:0.5f]];
    [points addObject:[[StatePoints alloc] setDistnaceX:-100.0f andY:50.0f withTime:0.5f]];
    [points addObject:[[StatePoints alloc] setDistnaceX:0.0f andY:100.0f withTime:0.5f]];
    [points addObject:[[StatePoints alloc] setDistnaceX:100.0f andY:100.0f withTime:0.5f]];
}

@end
