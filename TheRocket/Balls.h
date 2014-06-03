//
//  Balls.h
//  TheRocket
//
//  Created by lojsk on 03/06/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Headers.TheRocket.classes.h"

@interface Balls : NSObject

@property (nonatomic, retain) Vector2 *position;
@property float distance;

-(Balls*) setX:(float)x andY:(float)y withDistance:(float)dist;

@end
