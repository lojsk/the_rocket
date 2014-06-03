//
//  FormationMonster.m
//  TheRocket
//
//  Created by OdpiralniCasi on 03/03/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation LoadMonster

- (id) initWithArray:(NSMutableArray*)array andLastPosition:(float)theLastPosition
{
    Vector2 *xy = ((StatePoints*)[array objectAtIndex:array.count-1]).distance;
	self = [super initWithX:xy.x andY:xy.y+theLastPosition];
	if (self != nil) {
		[self addPoints:array];
	}
	return self;
}

- (void) addPoints:(NSMutableArray*)array {
//StatePoints *start = [array objectAtIndex:0];
    for(int i=0;i<[array count]-1;i++) {
        StatePoints *point = [array objectAtIndex:i];
        [points insertObject:[[StatePoints alloc] setDistnaceX:point.distance.x
                                                          andY:point.distance.y
                                                      withTime:[point.time floatValue]]
                     atIndex:0];
        //start = point;
    }
}

@end
