//
//  Bullet.h
//  TheRocket
//
//  Created by OdpiralniCasi on 04/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.classes.h"

@interface Bullet : NSObject<IParticle, ICustomCollider, ISceneUser, ICustomUpdate, ICollisionID, IGetCordinate, IMovable> {
    Vector2 *position;
	float radius;
	float mass;
    id<IScene> scene;
}

- (id) initWithBulletPoint:(BulletPoint*)bp andPlayerPosition:(Vector2*)player andGame:(Game*)theGame;



@end

