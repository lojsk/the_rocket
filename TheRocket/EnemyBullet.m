//
//  EnemyBullet.m
//  TheRocket
//
//  Created by OdpiralniCasi on 03/03/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation EnemyBullet

- (id) initWithBulletPoint:(BulletPoint*)bp andPlayerPosition:(Vector2*)player andGame:(Game*)theGame
{
	self = [super initWithBulletPoint:bp andPlayerPosition:player andGame:theGame];
	if (self != nil) {
        setID = [NSSet setWithObjects:[Rocket class], nil];
	}
	return self;
}

@synthesize setID;

@end
