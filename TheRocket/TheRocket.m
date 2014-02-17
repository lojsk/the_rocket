//
//  TheRocket.m
//  TheRocket
//
//  Created by OdpiralniCasi on 27/10/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import "TheRocket.h"
#import "Headers.TheRocket.h"
#import "Artificial.Control.h"

@implementation TheRocket

- (id) init
{
	self = [super init];
	if (self != nil) {
		graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
        
		//[self.components addComponent:[[Gameplay alloc] initWithGame:self]];
		//[self.components addComponent:[[FpsComponent alloc] initWithGame:self]];
        [self.components addComponent:[[TouchPanelHelper alloc] initWithGame:self]];
        
        stateStack = [[NSMutableArray alloc] init];
				
		progress = [GameProgress loadProgress];
	}
	return self;
}

- (void) initialize {    
	// Start in main menu.
	
    // pushMenu
    MainMenu *mainMenu = [[MainMenu alloc] initWithGame:self];
	[self pushState:mainMenu];
    
    // pushGameplay
    //[self pushState:[[Gameplay alloc] initWithGame:self]];

	[super initialize];
}

- (void) pushState:(GameState *)gameState {
	GameState *currentActiveState = [stateStack lastObject];
	[currentActiveState deactivate];
	[self.components removeComponent:currentActiveState];
	
	[stateStack addObject:gameState];
	[self.components addComponent:gameState];
	[gameState activate];
}

- (void) popState {
	GameState *currentActiveState = [stateStack lastObject];
	[stateStack removeLastObject];
	[currentActiveState deactivate];
	[self.components removeComponent:currentActiveState];
	
	currentActiveState = [stateStack lastObject];
	[self.components addComponent:currentActiveState];
	[currentActiveState activate];
}


@end
