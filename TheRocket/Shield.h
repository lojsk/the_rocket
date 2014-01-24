//
//  Shield.h
//  TheRocket
//
//  Created by OdpiralniCasi on 22/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.classes.h"

@interface Shield : NSObject<IParticle, ICustomCollider, ILifetime, ISceneUser, ICustomUpdate, IPosition, ICollisionID, IGetCordinate> {
    NSTimeInterval duration;
    float start;
    Lifetime *lifetime;
	id<IScene> scene;
    Vector2 *position;
    
    float radius;
	float mass;
}

- (id) initWithDuration:(int)theDuration andPosition:(Vector2*)thePosition;

@end

