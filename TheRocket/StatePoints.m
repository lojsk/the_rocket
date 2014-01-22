//
//  StatePoints.m
//  TheRocket
//
//  Created by OdpiralniCasi on 19/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "StatePoints.h"

#import "Headers.TheRocket.h"

@implementation StatePoints

@synthesize distance, time, rocketSpeed;

-(StatePoints*) setDistnaceX:(float)x andY:(float)y withTime:(float)t {
    distance = [Vector2 vectorWithX:x y:y];
    time = [NSNumber numberWithFloat:t];
    rocketSpeed = NO;
    return self;
}

-(StatePoints*) setDistnaceX:(float)x withTime:(float)t {
    distance = [Vector2 vectorWithX:x y:0];
    time = [NSNumber numberWithFloat:t];
    rocketSpeed = YES;
    return self;
}

-(StatePoints*) setDistnaceWithTime:(float)t {
    distance = nil;
    time = [NSNumber numberWithFloat:t];
    rocketSpeed = YES;
    return self;
}

@end
