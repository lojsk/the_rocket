//
//  Gameplay.m
//  Wall
//
//  Created by Matej Jan on 15.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Gameplay.h"

#import "Headers.TheRocket.h"

@implementation Gameplay

- (id) initWithGame:(Game *)theGame
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		level = [[Level alloc] initWithGame:self.game];
		
		player = [[Player alloc] initWithGame:self.game Rocket:level.player Scene:level.scene];
        camera = [[Camera alloc] initWithGame:self.game Object:player];
		physics = [[Physics alloc] initWithGame:self.game level:level];
		renderer = [[Renderer alloc] initWithGame:self.game gameplay:self];
		debugRenderer = [[DebugRenderer alloc] initWithGame:self.game scene:level.scene];

		player.updateOrder = 0;		// First the game should process input.		
		physics.updateOrder = 1;	// Then the physics engine updates the world.
		level.updateOrder = 2;		// Level updates the scene.
        camera.updateOrder = 3;
		self.updateOrder = 4;		// At last gameplay rules are executed.
		
		[self.game.components addComponent:level];
		[self.game.components addComponent:player];
		[self.game.components addComponent:physics];
        [self.game.components addComponent:camera];
		[self.game.components addComponent:renderer];	
		
		// [self.game.components addComponent:debugRenderer];		
	}
	return self;
}

@synthesize level, lives, camera;

- (void) initialize {
	debugRenderer.colliderColor = [Color black];
	debugRenderer.movementColor = [Color blue];
	debugRenderer.itemColor = [Color red];
	debugRenderer.transformMatrix = renderer.camera;
	
	[player setCamera:renderer.camera];

	[super initialize];
}

- (void) updateWithGameTime:(GameTime *)gameTime {


}



@end
