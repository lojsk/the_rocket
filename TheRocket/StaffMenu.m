//
//  StaffMenu.m
//  TheRocket
//
//  Created by OdpiralniCasi on 05/02/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "StaffMenu.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Headers.TheRocket.h"

@implementation StaffMenu

- (void) initialize {
	[super initialize];
	
	// Background
	Texture2D *tableTexture = [self.game.content load:@"gamePause"];
	backgorund = [[Image alloc] initWithTexture:tableTexture position:[Vector2 vectorWithX:100 y:100]];
	[backgorund setScaleUniform: 1];
	//[scene addItem:backgorund];
    
    retur = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:50 y:50 width:200 height:200] background:nil];
	[scene addItem:retur];
    
    reset = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:100 y:500 width:300 height:50] background:nil];
	[scene addItem:reset];
    
    menu = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:100 y:600 width:300 height:50] background:nil];
	[scene addItem:menu];

}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
	
	GameState *newState = nil;
	
    if (retur.wasReleased) {
		[theRocket popState];
    } else if(reset.wasReleased) {
        [theRocket popState];
        [theRocket popState];
        newState = [[Gameplay alloc] initWithGame:self.game];
    } else if(menu.wasReleased) {
        [theRocket popState];
        [theRocket popState];
    }
	
	if (newState) {
		[theRocket pushState:newState];
	}
}

@end
