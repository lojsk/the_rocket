//
//  EndGameMenu.m
//  TheRocket
//
//  Created by OdpiralniCasi on 13/02/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "EndGameMenu.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Headers.TheRocket.h"


@implementation EndGameMenu

- (void) initialize {
	[super initialize];
	
	// Background
	Texture2D *tableTexture = [self.game.content load:@"endGame"];
	backgorund = [[Image alloc] initWithTexture:tableTexture position:[Vector2 vectorWithX:100 y:100]];
	[backgorund setScaleUniform: 1];
	[scene addItem:backgorund];
    
    retur = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:100 y:200 width:300 height:300] background:nil];
    [scene addItem:retur];
    
    reset = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:100 y:600 width:100 height:50] background:nil];
	[scene addItem:reset];
    
    menu = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:300 y:600 width:100 height:50] background:nil];
	[scene addItem:menu];
    
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
	
	GameState *newState = nil;
	if(retur.wasReleased) {
        newState = [[chooseStaffMenu alloc] initWithGame:self.game];
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
