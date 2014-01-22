//
//  StateMonster.m
//  TheRocket
//
//  Created by OdpiralniCasi on 19/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation StateMonster

- (id) initWithX:(int)x andY:(int)y
{
	self = [super initWithX:x andY:y];
	if (self != nil) {
		points = [[NSMutableArray alloc] init];
        currentPoint = 0;
        getStartTime = NO;
	}
	return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    if(getStartTime == NO) {
        startTime = gameTime.totalGameTime;
        getStartTime = YES;
    }
    
    if(gameTime.totalGameTime - startTime > totalTime && currentPoint < [points count]) {
        velocity = [self calculateVelocity:[points objectAtIndex:currentPoint]];
        totalTime += [((StatePoints*)[points objectAtIndex:currentPoint]).time floatValue];
        currentPoint++;
    }
}

-(Vector2*)calculateVelocity:(StatePoints*)point {
    if(!point.distance)
        return [Vector2 vectorWithX:0.0f y:-[Constants gameSpeed]];
    if(point.rocketSpeed)
        return [Vector2 vectorWithX:point.distance.x/[point.time floatValue] y:-[Constants gameSpeed]];
    return [Vector2 vectorWithX:point.distance.x/[point.time floatValue] y:point.distance.y/[point.time floatValue]];
}

@end
