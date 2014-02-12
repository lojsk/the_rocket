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

@interface AIArea : NSObject<IParticle, ICustomCollider, ICollisionID, IGetCordinate> {
	id<IScene> scene;
    Vector2 *position;
    Vector2 *direction;
    Vector2 *distance;
    
    float radius;
	float mass;
    
    BOOL directionVel;
    
    id<IScene>scena;
    id cObject;
}

@property BOOL inScene;
- (id) initWithObject:(id<ISceneUser>)theObject;
- (id) initWithDistance:(Vector2*)theDistance andObject:(id<ISceneUser>)theObject;
-(void)updatePosition:(id<IMovable>)object;
-(void)removeItem;

@end
