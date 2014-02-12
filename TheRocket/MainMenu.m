//
//  MainMenu.m
//  friHockey
//
//  Created by Matej Jan on 21.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "MainMenu.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Headers.TheRocket.h"

@implementation MainMenu

- (void) initialize {
	[super initialize];
	
	// Background
	Texture2D *tableTexture = [self.game.content load:@"level4"];
	backgorund = [[Image alloc] initWithTexture:tableTexture position:[Vector2 vectorWithX:-60 y:0]];
	[backgorund setScaleUniform: 4];
	[scene addItem:backgorund];
    
    // Buttons
    planet = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:100 y:400 width:buttonBackground.width height:buttonBackground.height] background:buttonBackground];
	[planet.backgroundImage setScaleUniform:0.4];
	[scene addItem:planet];
	
    buy = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:100 y:100 width:buttonBackground.width height:buttonBackground.height] background:buttonBackground];
	[buy.backgroundImage setScaleUniform:0.6];
	[scene addItem:buy];
	
	// Text
    /*

     title = [[Label alloc] initWithFont:retrotype text:@"friHockey" position:[Vector2 vectorWithX:160 y:10]];
     title.horizontalAlign = HorizontalAlignCenter;
     [scene addItem:title];
     
     subtitle = [[Label alloc] initWithFont:fivexfive text:@"by Matej Jan" position:[Vector2 vectorWithX:320 y:50]];
     subtitle.horizontalAlign = HorizontalAlignRight;
     [scene addItem:subtitle];
     
	subtitle = [[Label alloc] initWithFont:fivexfive text:@"by Matej Jan" position:[Vector2 vectorWithX:320 y:50]];
	subtitle.horizontalAlign = HorizontalAlignRight;
	[scene addItem:subtitle];
	
	copyright = [[Label alloc] initWithFont:fivexfive text:@""
				 "3D modeling by\n"
				 "Matjaz Lamut\n"
				 "Published by GameTeam, Fri\n"
				 "Copyright 2011 Razum d.o.o.\n"
				 "All Rights Reserved v0.4" position:[Vector2 vectorWithX:4 y:462]];
	copyright.verticalAlign = VerticalAlignBottom;
	[scene addItem:copyright];
	*/
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
	
	GameState *newState = nil;
	
    if (planet.wasReleased) {
		newState = [[Gameplay alloc] initWithGame:self.game];
    } else if(buy.wasReleased) {
        newState = [[StaffMenu alloc] initWithGame:self.game];
    }
    
	
	if (newState) {
		[theRocket pushState:newState];
	}
}



@end
