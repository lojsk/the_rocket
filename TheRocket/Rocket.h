//
//  Mallet.h
//  FriHockey
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.h"

@interface Rocket : NSObject <ICollisionID, ICustomCollider, ISceneUser, IGetCordinate, IParticle> { //
	Vector2 *position;
	float radius;
	float mass;
    id<IScene> scene;
}

@end