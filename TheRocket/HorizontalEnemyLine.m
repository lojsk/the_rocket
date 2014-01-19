//
//  HorizontalEnemyLine.m
//  TheRocket
//
//  Created by OdpiralniCasi on 08/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "HorizontalEnemyLine.h"

@implementation HorizontalEnemyLine

- (id) initWithLimit:(AAHalfPlane *)theLimit
{
	self = [super init];
	if (self != nil) {
		limit = theLimit;
        setID = [NSSet setWithObjects:[Bullet class], nil];
	}
	return self;
}

@synthesize setID;

- (void) updateWithGameTime:(GameTime *)gameTime {
    limit = [AAHalfPlane aaHalfPlaneWithDirection:limit.direction distance:limit.distance -= [Constants gameSpeed]];
}
@end
