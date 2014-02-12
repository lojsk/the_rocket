//
//  Button.h
//  friHockey
//
//  Created by Matej Jan on 21.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Artificial.Mirage.h"

#import "Express.Scene.Objects.h"
#import "Express.Scene.h"

#import "Express.Graphics.h"

@interface Button : NSObject <ISceneUser, ICustomUpdate> {
	id<IScene> scene;

	Image *backgroundImage;
		
	Rectangle *inputArea;
	BOOL enabled;
	
	BOOL isDown;
	BOOL wasPressed;
	BOOL wasReleased;
	int pressedID;	
}

- (id) initWithInputArea:(Rectangle*)theInputArea background:(Texture2D*)background;
- (void) updateWithInverseView:(Matrix *)inverseView;

@property (nonatomic, readonly) Rectangle *inputArea;
@property (nonatomic) BOOL enabled;

@property (nonatomic, readonly) BOOL isDown;
@property (nonatomic, readonly) BOOL wasPressed;
@property (nonatomic, readonly) BOOL wasReleased;

@property (nonatomic, readonly) Image *backgroundImage;

@end
