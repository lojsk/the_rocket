//
//  AIArea.h
//  TheRocket
//
//  Created by OdpiralniCasi on 22/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.classes.h"

@interface AIArea : NSObject<IParticle, ICustomCollider, ISceneUser, ICustomUpdate, IPosition, ICollisionID, IGetCordinate> {
	id<IScene> scene;
    Vector2 *position;
    Vector2 *direction;
    float disance;
    
    float radius;
	float mass;
}

- (id) initWithPosition:(Vector2*)thePosition direction:(Vector2 *)theDirection andDistance:(float)theDistance;

@end
