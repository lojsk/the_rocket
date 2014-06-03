//
//  Balls.m
//  TheRocket
//
//  Created by lojsk on 03/06/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Balls.h"

#import "Headers.TheRocket.h"

@implementation Balls

@synthesize position, distance;

-(Balls*) setX:(float)x andY:(float)y withDistance:(float)dist {
    position = [Vector2 vectorWithX:x y:y];
    distance = dist;
    return self;
}

@end
