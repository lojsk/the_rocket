//
//  BasicAIMonster.m
//  TheRocket
//
//  Created by OdpiralniCasi on 26/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation BasicAIMonster

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
    [points addObject:[[StatePoints alloc] setDistnaceX:0.0f andY:1000.0f withTime:5.0f]];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    if(aiModal == nil)
        aiModal = [[AIMonsterModel alloc] initWithObject:self];
    [aiModal updateWithGameTime:gameTime andObject:self];
    
    [super updateWithGameTime:gameTime];
}

- (void)bulletAvoid {
    totalTime = 0;
    currentPoint = 0;
    getStartTime = NO;
    int way = [Random intGreaterThanOrEqual:0 lessThan:1];
    if(way == 0)
        way = -1;
    [points insertObject:[[StatePoints alloc] setDistnaceX:100.0f*way andY:-100.0f withTime:0.2f] atIndex:0];
    [aiModal removeItems];
}

- (BOOL) collidingWithItem:(id)item {
    return YES;
}

- (void) collidedWithItem:(id)item {
    [super collidedWithItem:item];
    [aiModal removeItems];
}

@end
