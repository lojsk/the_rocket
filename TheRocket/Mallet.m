//
//  Mallet.m
//  FriHockey
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Mallet.h"


@implementation Mallet

- (id) init
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
	}
	return self;
}

@synthesize position;



@end
