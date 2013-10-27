//
//  Level.m
//  FriHockey
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Level.h"
#import "Headers.TheRocket.h"

@implementation Level

- (id) init
{
	self = [super init];
	if (self != nil) {
		player = [[Rocket alloc] init];
        [player setPosition:[Vector2 vectorWithX:50 y:50]];
		
		scene = [[Scene alloc] init];
		[scene addItem:player];
	}
	return self;
}

@synthesize scene;



@end
