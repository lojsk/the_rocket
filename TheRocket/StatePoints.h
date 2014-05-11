//
//  StatePoints.h
//  TheRocket
//
//  Created by OdpiralniCasi on 19/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Headers.TheRocket.classes.h"

@interface StatePoints : NSObject

@property (nonatomic, retain) Vector2 *distance;
@property (nonatomic, retain) NSNumber *time;
@property BOOL rocketSpeed;
@property BOOL isVelocity;

-(StatePoints*) setDistnaceX:(float)x andY:(float)y withTime:(float)t;
-(StatePoints*) setX:(float)x Y:(float)y withTime:(float)t;
-(StatePoints*) setDistnaceX:(float)x withTime:(float)t;
-(StatePoints*) setDistnaceWithTime:(float)t;

@end
