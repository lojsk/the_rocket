//
//  Explosion.m
//  TheRocket
//
//  Created by OdpiralniCasi on 07/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Explosion.h"

@implementation Explosion

- (id) initWithDuration:(int)theDuration andPosition:(Vector2*)thePosition
{
    self = [super init];
	if (self != nil) {
        lifetime = [[Lifetime alloc] initWithStart:0 duration:theDuration];
        position = [[Vector2 alloc] initWithVector2:thePosition];
	}
	return self;
}

@synthesize lifetime, scene, position;

- (BOOL) collidingWithItem:(id)item {
	return NO;
}
- (void) deactivate{
   // [SoundEngine play:SoundEffectTypeExplosion];
    
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	if (lifetime) {
		[lifetime updateWithGameTime:gameTime];
		if (!lifetime.isAlive) {
            [scene removeItem:self];
            //[self deactivate];
		}
	}
}

@end
