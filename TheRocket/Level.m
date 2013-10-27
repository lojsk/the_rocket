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
		player1Mallet = [[Mallet alloc] init];
		player2Mallet = [[Mallet alloc] init];
		
		scene = [[Scene alloc] init];
		[scene addItem:player1Mallet];
		[scene addItem:player2Mallet];
	}
	return self;
}

@synthesize scene;



@end
