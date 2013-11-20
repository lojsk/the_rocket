//
//  Player.h
//  Wall
//
//  Created by Matej Jan on 15.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Input.Touch.h"

#import "Headers.TheRocket.classes.h"

@interface Player : GameComponent {
	Rocket *rocket;
	Matrix *inverseView;
}

- (id) initWithGame:(Game*)theGame Rocket:(Rocket *)theRocket;

- (void) setCamera:(Matrix *)camera;

- (void) updateWithGameTime:(GameTime*)gameTime;

@end
