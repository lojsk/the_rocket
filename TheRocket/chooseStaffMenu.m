//
//  chooseStaffMenu.m
//  TheRocket
//
//  Created by OdpiralniCasi on 13/02/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "EndGameMenu.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Headers.TheRocket.h"

@implementation chooseStaffMenu

- (void) initialize {
	[super initialize];
	
	// Background
	Texture2D *tableTexture = [self.game.content load:@"chooseStaff"];
	backgorund = [[Image alloc] initWithTexture:tableTexture position:[Vector2 vectorWithX:100 y:100]];
	[backgorund setScaleUniform: 1];
	[scene addItem:backgorund];
    
    
    el1 = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:100 y:100 width:100 height:50] background:nil];
	[scene addItem:el1];
    
    el2 = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:100 y:300 width:100 height:50] background:nil];
	[scene addItem:el2];
    
    retur = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:100 y:600 width:100 height:50] background:nil];
	[scene addItem:retur];
    
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
	
	GameState *newState = nil;
	
    if(el1.wasReleased) {
        // buy 1 staff
    } else if(el2.wasReleased) {
        // buy 2 staff
    } else if(retur.wasReleased) {
        [theRocket popState];
    }
	
	if (newState) {
		[theRocket pushState:newState];
	}
}

@end
