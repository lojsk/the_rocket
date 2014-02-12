//
//  GameState.m
//  friHockey
//
//  Created by Matej Jan on 22.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GameState.h"


@implementation GameState

- (id) initWithGame:(Game *)theGame
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		theRocket = (TheRocket*)self.game;
	}
	return self;
}

@synthesize theRocket;

- (void) activate {}
- (void) deactivate {}

@end
