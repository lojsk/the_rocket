//
//  Bullet.m
//  TheRocket
//
//  Created by OdpiralniCasi on 04/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Bullet.h"
#import "Retronator.Xni.Framework.Audio.h"

@implementation Bullet

- (id) initWithPosition:(Vector2 *)thePosition andGame:(Game*)theGame
{
	self = [super init];
	if (self != nil) {
		position = [Vector2 vectorWithX:thePosition.x y:thePosition.y];
        velocity = [[Vector2 alloc] init];
		radius = 10;
		mass = 1;
        setID = [NSSet setWithObjects:[HorizontalLine class], nil];
        [self playSound:theGame];
	}
	return self;
    
    
}

@synthesize position, velocity, mass, radius, scene, setID;

- (void) playSound:(Game*)game {
    SoundEffect *soundEffect = [game.content load:@"bulletSoundNew"];
    [soundEffect play];
}

- (BOOL) collidingWithItem:(id)item {
    if([item isKindOfClass:[VerticalLine class]])
        return YES;
    return NO;
}

- (void) collidedWithItem:(id)item {
    [scene removeItem:self];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    position.y -= [Constants bulletSpeed];
}

@end