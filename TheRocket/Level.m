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
        scene = [[SimpleScene alloc] initWithGame:self.game];
        [self.game.components addComponent:scene];
        
		player = [[Rocket alloc] init];
	}
	return self;
}

- (void) initialize {
	player.position.x = 50;
	player.position.y = 50;
}

@synthesize scene;




@end
