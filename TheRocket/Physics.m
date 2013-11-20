//
//  Physics.m
//  Wall
//
//  Created by Matej Jan on 15.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Physics.h"

#import "Express.Physics.h"

#import "Headers.TheRocket.h"

@implementation Physics

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
	if (self = [super initWithGame:theGame]) {
		level = theLevel;
	}
	return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    /*
	[MovementPhysics simulateMovementOn:level.ball withElapsed:gameTime.elapsedGameTime];
	
	for (id item in level.scene) {
		if (item != level.ball) {
			[Collision collisionBetween:level.ball and:item];
		}
	}*/
}

@end
