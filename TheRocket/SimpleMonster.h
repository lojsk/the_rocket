//
//  SimpleMonster.h
//  TheRocket
//
//  Created by OdpiralniCasi on 06/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.h"

@interface SimpleMonster : NSObject <IParticle, ICollisionID, ICustomCollider, ISceneUser, IGetCordinate> {
	Vector2 *position;
	Vector2 *velocity;
	float radius;
	float mass;
    id<IScene> scene;
}

- (id) initWithX:(int)x andY:(int)y;

@end
