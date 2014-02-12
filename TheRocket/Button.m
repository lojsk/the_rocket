//
//  Button.m
//  friHockey
//
//  Created by Matej Jan on 21.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Button.h"

#import "Retronator.Xni.Framework.Input.Touch.h"

#import "Artificial.Control.h"

@implementation Button

- (id) initWithInputArea:(Rectangle*)theInputArea background:(Texture2D*)background
{
	self = [super init];
	if (self != nil) {
		inputArea = theInputArea;
		enabled = YES;
		backgroundImage = [[Image alloc] initWithTexture:background position:[Vector2 vectorWithX:inputArea.x y:inputArea.y]];		
	}
	return self;
}

@synthesize inputArea, enabled, isDown, wasPressed, wasReleased, scene, backgroundImage;

- (void) addedToScene:(id <IScene>)theScene {
	// Add child items to scene.
	[theScene addItem:backgroundImage];
}

- (void) removedFromScene:(id <IScene>)theScene {
	// Remove child items.
	[theScene removeItem:backgroundImage];
}

- (void) updateWithInverseView:(Matrix *)inverseView  {
	if (!enabled) {
		return;
	}
    
	TouchCollection *touches = [TouchPanelHelper getState];
	if (!touches) {
		return;
	}
    
	BOOL wasDown = isDown;
	
	isDown = NO;
	wasPressed = NO;
	wasReleased = NO;
	
	for (TouchLocation *touch in touches) {
        Vector2* touchInScene = [Vector2 transform:touch.position with:inverseView];
        
        /*
        NSLog(@"%@", inputArea);
        NSLog(@"%@", inverseView);
        NSLog(@"%@", touchInScene);
         */
		if ([inputArea containsVector:touchInScene] && touch.state != TouchLocationStateInvalid) {
            
			if (touch.state == TouchLocationStatePressed) {
				pressedID = touch.identifier;
				wasPressed = YES;
			}
			
			// Only act to the touch that started the push.
			if (touch.identifier == pressedID) {
				if (touch.state == TouchLocationStateReleased) {
					wasReleased = YES;
				} else {
					isDown = YES;
				}
			}
		}
	}
    
	if (isDown && !wasDown) {
		// hover
	} else if (!isDown && wasDown) {
		// back
	}
}

@end
