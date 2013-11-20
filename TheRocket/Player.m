//
//  Player.m
//  Wall
//
//  Created by Matej Jan on 15.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Player.h"

#import "Headers.TheRocket.h"

@implementation Player

- (id) initWithGame:(Game*)theGame Rocket:(Rocket *)theRocket
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		rocket= theRocket;
	}
	return self;
}

- (void) setCamera:(Matrix *)camera {
    NSLog(@"%@", camera);
	inverseView = [Matrix invert:camera];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	TouchCollection *touches = [TouchPanel getState];
	
	if ([touches count] == 1) {
		TouchLocation *touch = [touches objectAtIndex:0];
		

		Vector2* touchInScene = [Vector2 transform:touch.position with:inverseView];
		
		rocket.position.x = touchInScene.x;
	}
}

@end
