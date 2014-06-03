//
//  HorizontalLineRemoveEnemy.m
//  TheRocket
//
//  Created by lojsk on 15/05/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.h"

@implementation HorizontalLineRemoveEnemy

- (id) initWithLimit:(AAHalfPlane *)theLimit setID:(NSSet*)theSet andPosition:(Vector2*)thePosition
{
	self = [super init];
	if (self != nil) {
		limit = theLimit;
        position = thePosition;
        velocity = [Vector2 vectorWithX:0 y:-200];
        setID = theSet; //[NSSet setWithObjects:[Bullet class], nil];
	}
	return self;
}

@synthesize setID, position, velocity;

@end
