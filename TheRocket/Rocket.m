//
//  Mallet.m
//  FriHockey
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Rocket.h"


@implementation Rocket

- (id) initWithLevel:(Level*)theLevel
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		velocity = [Vector2 vectorWithX:0 y:-[Constants gameSpeed]];
		radius = 10;
		mass = 1;
        setID = [NSSet setWithObjects:[VerticalLine class], [SimpleMonster class], [ZMonster class], [EnemyBullet class], [KamikazeMonster class], nil];
        level = theLevel;
	}
	return self;
}

@synthesize position, velocity, mass, radius, setID, scene;


- (BOOL) collidingWithItem:(id)item {
    return YES;
}

- (void) collidedWithItem:(id)item {
    if([item isKindOfClass:[SimpleMonster class]]) {
        [scene removeItem:self];
        [level endGame];
    } else if([item isKindOfClass:[VerticalLine class]]) {
        
    }
}

@end
