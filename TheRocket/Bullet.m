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

- (id) initWithBulletPoint:(BulletPoint*)bp andPlayerPosition:(Vector2*)player andGame:(Game*)theGame
{
	self = [super init];
	if (self != nil) {
		position = [Vector2 vectorWithX:player.x+bp.position.x y:player.y+bp.position.y];
        velocity = [Vector2 vectorWithX:bp.velocity.x y:bp.velocity.y];        
		radius = 10;
		mass = 1;
        setID = [NSSet setWithObjects:[HorizontalLine class], [SimpleMonster class], [ZMonster class], [AIArea class], nil];
        [self playSound:theGame];
	}
	return self;
    
    
}

@synthesize position, velocity, mass, radius, scene, setID;

- (void) playSound:(Game*)game {
    SoundEffect *soundEffect = [game.content load:@"bulletSoundNew"];
   // [soundEffect play];
}

- (BOOL) collidingWithItem:(id)item {
    return YES;
}

- (void) collidedWithItem:(id)item {
    if(![item isKindOfClass:[AIArea class]])
        [scene removeItem:self];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
}

@end