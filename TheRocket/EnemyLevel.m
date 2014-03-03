//
//  EnemyLevel.m
//  TheRocket
//
//  Created by OdpiralniCasi on 06/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "EnemyLevel.h"

@implementation EnemyLevel

- (id) init
{
	self = [super init];
	if (self != nil) {
        levelArray = [[NSMutableArray alloc] init];
        lastPosition = -200;
        maxLevel = 7;
	}
	return self;
}

@synthesize levelArray, maxLevel;

- (void) loadLevel:(int)level {
    switch(level) {
        case 1: [self loadLevel1]; break;
        case 2: [self loadLevel2]; break;
        case 3: [self loadLevel3]; break;
        case 4: [self loadLevel4]; break;
        case 5: [self loadLevel5]; break;
        case 6: [self loadLevel6]; break;
        case 7: [self loadLevel7]; break;
    }
    // TODO: grajenje stopnje
    /*

    */
}

- (void)loadLevel1 {
    lastPosition -= 200;
    for(int i=1;i<20;i++) {
        lastPosition -= [Random intGreaterThanOrEqual:10 lessThan:100];
        [levelArray addObject:[[SimpleMonster alloc] initWithX:[Random intGreaterThanOrEqual:10 lessThan:720] Y:lastPosition andVelocityY:[Random intGreaterThanOrEqual:300 lessThan:600]]];
    }
}

- (void)loadLevel2 {
    for(int i=1;i<10;i++) {
        lastPosition -= 40;
        [levelArray addObject:[[ZMonster alloc] initWithX:100 andY:lastPosition]];
    }
}

- (void)loadLevel3 {
    lastPosition -= 200;
    int x = 50;
    for(int i=1;i<5;i++) {
        [levelArray addObject:[[KamikazeMonster alloc] initWithX:x andY:lastPosition]];
        x += 50;
    }
}

- (void)loadLevel4 {
    lastPosition -= 200;
    for(int i=1;i<2;i++) {
        lastPosition -= [Random intGreaterThanOrEqual:10 lessThan:100];
        [levelArray addObject:[[BasicAIMonster alloc] initWithX:[Random intGreaterThanOrEqual:10 lessThan:720] andY:lastPosition]];
    }
}

- (void)loadLevel5 {
    lastPosition -= 200;
    for(int i=1;i<3;i++) {
        lastPosition -= [Random intGreaterThanOrEqual:10 lessThan:100];
        [levelArray addObject:[[ShotMonster alloc] initWithX:[Random intGreaterThanOrEqual:10 lessThan:720] Y:lastPosition andVelocityY:10.0f]];
    }
}

- (void)loadLevel6 {
    lastPosition -= 200;
    int y = 50;
    for(int j=0;j<3;j++) {
        int x = 70;
        for(int i=1;i<8;i++) {
            [levelArray addObject:[[KamikazeMonster alloc] initWithX:x andY:lastPosition+y]];
            x += 70;
        }
        y += 50;
    }
    lastPosition -= 500;
}


- (void)loadLevel7 {
    lastPosition -= 200;
    for(int i=1;i<10;i++) {
        lastPosition -= 40;
        [levelArray addObject:[[FormationMonster alloc] initWithX:50 andY:lastPosition]];
    }
     lastPosition -= 200;
}

@end
