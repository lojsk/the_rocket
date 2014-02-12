//
//  Menu.m
//  friHockey
//
//  Created by Matej Jan on 22.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Menu.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

#import "Headers.TheRocket.h"

@implementation Menu

- (id) initWithGame:(Game *)theGame
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		scene = [[SimpleScene alloc] initWithGame:self.game];		
		renderer = [[GuiRenderer alloc] initWithGame:self.game scene:scene];
	}
	return self;
}

- (void) activate {
	[self.game.components addComponent:scene];
	[self.game.components addComponent:renderer];	
}

- (void) deactivate {
	[self.game.components removeComponent:scene];
	[self.game.components removeComponent:renderer];	
}

- (void) initialize {
	// Fonts
	FontTextureProcessor *fontProcessor = [[FontTextureProcessor alloc] init];
	retrotype = [self.game.content load:@"Retrotype" processor:fontProcessor];
	fivexfive = [self.game.content load:@"5x5" processor:fontProcessor];
	fivexfive.lineSpacing = 14;

	// Buttons
	buttonBackground = [self.game.content load:@"planet"];
	
	[super initialize];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // update all object wich have ICustomUpdate modul
    Matrix *inverseView = [Matrix invert:renderer.camera];
    for (id item in scene) {
        Button *button = [item isKindOfClass:[Button class]] ? item : nil;
        if (button) {
            [button updateWithInverseView:inverseView];
        }
    }
    
	if (back.wasReleased) {
		[theRocket popState];
	}
}

// Update all buttons.


@end
