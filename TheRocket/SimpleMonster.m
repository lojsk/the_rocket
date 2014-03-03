//
//  SimpleMonster.m
//  TheRocket
//
//  Created by OdpiralniCasi on 06/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation SimpleMonster

- (id) initWithX:(int)x andY:(int)y
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] initWithX:x y:y];
		velocity = [Vector2 vectorWithX:0.0f y:100.0f];
		radius = 10;
		mass = 1;
        setID = [NSSet setWithObjects:[Bullet class], [Rocket class], [EnemyScene class], [Shield class], nil];
        live = 1;
        delegateS = [Constants getScoreClass];
	}
	return self;
}

- (id) initWithX:(int)x Y:(int)y andVelocityY:(int)vY {
    self = [self initWithX:x andY:y];
    if(self != nil) {
        velocity = [Vector2 vectorWithX:0.0f y:vY];
    }
    return self;
}

@synthesize position, velocity, mass, radius, setID, scene, delegateS;


- (BOOL) collidingWithItem:(id)item {
    return YES;
}

- (void) collidedWithItem:(id)item {
    //If anyone listening
    if([item isKindOfClass:[Bullet class]] || [item isKindOfClass:[Rocket class]]) {
        if([delegateS respondsToSelector:@selector(ChangeScore:)]) {
            [delegateS ChangeScore:1];
        }
        
        live--;
        
        if(live == 0) {
            [self.scene addItem:[[Explosion alloc] initWithDuration:1.0f andPosition:position]];
            [self.scene removeItem:self];
        }
    } else {
        //[scene addItem:[[Explosion alloc] initWithDuration:5 andPosition:position]];
        [self.scene removeItem:self];
    }
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    
}



@end
