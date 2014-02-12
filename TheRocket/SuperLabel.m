//
//  SuperLabel.m
//  TheRocket
//
//  Created by OdpiralniCasi on 04/02/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation SuperLabel

- (id) initWithVelocity:(Vector2*)theVelocity andLabel:(Label*)theLabel
{
	self = [super init];
	if (self != nil) {
		velocity = theVelocity;
        position = theLabel.position;
        label = theLabel;
	}
	return self;
}

- (void) setText:(NSString*)theText {
    [label setText:theText];
}

@synthesize position, velocity, label;

@end

