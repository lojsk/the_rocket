//
//  Background.h
//  TheRocket
//
//  Created by OdpiralniCasi on 08/12/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.h"

@interface Background : NSObject<IMovable> {
    Vector2 *position;
    int layer;
}

@property (nonatomic, readwrite) int layer;

- (id) initWithSpeed:(float)theSpeed andLayer:(int)theLayer withPosition:(Vector2*)thePosition;

@end
