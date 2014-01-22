//
//  StateMonster.h
//  TheRocket
//
//  Created by OdpiralniCasi on 19/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.classes.h"

@interface StateMonster : SimpleMonster<ICustomUpdate> {
    NSMutableArray *points;
    int currentPoint;
    float startTime;
    bool getStartTime;
    float totalTime;
}

- (id) initWithX:(int)x andY:(int)y;

@end
