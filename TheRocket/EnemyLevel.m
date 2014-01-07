//
//  EnemyLevel.m
//  TheRocket
//
//  Created by OdpiralniCasi on 06/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "EnemyLevel.h"

@implementation EnemyLevel

- (id) initWithScene:(id<IScene>)theScene
{
	self = [super init];
	if (self != nil) {
        scene = theScene;
	}
	return self;
}

@synthesize scene;

- (void) initialize {
/*    for(int i=0;i<20;i++) {
        [scene addItem:[[SimpleMonster alloc] initWithX:[Random intGreaterThanOrEqual:10 lessThan:700] andY:[Random intGreaterThanOrEqual:-10000 lessThan:200]]];
    } */
}

@end
