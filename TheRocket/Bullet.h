//
//  Bullet.h
//  TheRocket
//
//  Created by OdpiralniCasi on 04/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.h"

@interface Bullet : NSObject<IParticle, ICustomCollider, ISceneUser, ICustomUpdate, ICollisionID, IGetCordinate> {
    Vector2 *position;
	Vector2 *velocity;
	float radius;
	float mass;
    id<IScene> scene;
}

- (id) initWithPosition:(Vector2 *)thePosition andGame:(Game*)theGame;



@end

