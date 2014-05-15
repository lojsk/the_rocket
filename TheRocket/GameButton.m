//
//  GameButton.m
//  TheRocket
//
//  Created by OdpiralniCasi on 30/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation GameButton

- (id) initWithArea:(Rectangle*)theInputArea
{
	self = [super initWithInputArea:theInputArea background:nil];
	if (self != nil) {
		position = [Vector2 vectorWithX:theInputArea.x y:theInputArea.y];
		velocity = [Vector2 vectorWithX:0 y:0]; //-[Constants gameSpeed]];
	}
	return self;
}

@synthesize position, velocity;

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithInverseView:[Matrix invert:[Matrix createTranslationX:0 y:0 z:0]]];
}

@end
