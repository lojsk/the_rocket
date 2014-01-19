//
//  Player.h
//  Wall
//
//  Created by Matej Jan on 15.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

#import "Retronator.Xni.Framework.Input.Touch.h"

#import "Headers.TheRocket.classes.h"
#import "Headers.TheRocket.h"

@interface Player : GameComponent<IAARectangleCollider,IAARectangle, ICustomCollider, ICustomUpdate, ISceneUser, IMovable> {
    Matrix *inverseView;
    CMMotionManager *motionManager;
    CMAttitude *referenceAttitude;
    NSOperationQueue *queue;
    id<IScene> scene;
    float lastShot;
    float speed;
}

@property (nonatomic, readonly) Rocket *rocket;

- (id) initWithGame:(Game*)theGame Rocket:(Rocket *)theRocket Scene:(SimpleScene *)theScene;

- (void) setCamera:(Matrix *)camera;

- (void) updateWithGameTime:(GameTime*)gameTime;

@end
