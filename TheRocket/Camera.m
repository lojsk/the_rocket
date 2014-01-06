//
//  Camera.m
//  TheRocket
//
//  Created by OdpiralniCasi on 27/11/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import "Camera.h"
#import "Headers.TheRocket.h"

@implementation Camera

- (id) initWithGame:(Game*)theGame Object:(Player*)player
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		pinIt = player;
        camera = [Matrix createTranslationX:0 y:0 z:0];
        lastPosition = [Vector2 vectorWithX:pinIt.rocket.position.x y:pinIt.rocket.position.y];
	}
	return self;
}

@synthesize camera;

- (void) initialize {
    lastPosition = [Vector2 vectorWithX:0 y:pinIt.rocket.position.y];
}

- (void) updateWithGameTime:(GameTime *)gameTime {    
    camera = [Matrix createTranslationX:lastPosition.x
                                      y:pinIt.rocket.position.y*-1 + lastPosition.y
                                      z:0];
    
}
@end
