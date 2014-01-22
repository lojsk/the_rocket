//
//  BulletPoint.h
//  TheRocket
//
//  Created by OdpiralniCasi on 19/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.classes.h"

@interface BulletPoint : NSObject<IMovable>

-(BulletPoint*) initWithPosition:(Vector2*)thePosition andVelocity:(Vector2*)theVelocity;
-(BulletPoint*) initWithVelocity:(Vector2*)theVelocity;

@end
