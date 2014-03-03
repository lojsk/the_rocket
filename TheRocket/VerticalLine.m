//
//  VerticalLine.m
//  TheRocket
//
//  Created by OdpiralniCasi on 26/12/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.h"

@implementation VerticalLine

- (id) initWithLimit:(AAHalfPlane *)theLimit
{
	self = [super init];
	if (self != nil) {
		limit = theLimit;
        setID = [NSSet setWithObjects:[Rocket class], nil];
	}
	return self;
}

@synthesize setID;

- (AAHalfPlane *) aaHalfPlane {
	return limit;
}

- (HalfPlane *) halfPlane {
	return limit;
}

- (BOOL) collidingWithItem:(id)item {
    return YES;
}

- (void) collidedWithItem:(id)item {

}

- (void) updateWithGameTime:(GameTime *)gameTime {
    
}

@end
