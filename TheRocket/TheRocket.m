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

- (id) init {
    if (self = [super init]) {
        graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
    }
    return self;
}

- (void) initialize {
	// Create all levels.
	theLevel = [[Level alloc] init];
	
	// Start in first level.
	[self loadLevel:theLevel];
	
	// Initialize all components.
	[super initialize];
}

- (void) loadLevel:(Level *)level {
	
	// Remove the current renderer if it exists.
	if (renderer) {
		[self.components removeComponent:renderer];
	}
	
	// Create a new renderer for the new scene.
	renderer = [[Renderer alloc] initWithGame:self level:level];
	[self.components addComponent:renderer];
}


@end
