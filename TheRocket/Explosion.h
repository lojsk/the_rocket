//
//  Explosion.h
//  TheRocket
//
//  Created by OdpiralniCasi on 07/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.h"

@interface Explosion : NSObject<ILifetime, ISceneUser, ICustomUpdate, IPosition> {
    NSTimeInterval duration;
    float start;
    Lifetime *lifetime;
	id<IScene> scene;
    Vector2 *position;
}

- (id) initWithDuration:(int)theDuration andPosition:(Vector2*)thePosition;

@end
