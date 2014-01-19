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
	}
	return self;
}

@synthesize levelArray;

- (void) initialize {
    // TODO: grajenje stopnje
    for(int i=1;i<20;i++) {
        [levelArray addObject:[[SimpleMonster alloc] initWithX:200 andY:-200*i]];
    }
    
   /* for(int i=0;i<20;i++) {
        [scene addItem:[[SimpleMonster alloc] initWithX:[Random intGreaterThanOrEqual:10 lessThan:700] andY:[Random intGreaterThanOrEqual:-10000 lessThan:200]]];
    } 
    [scene addItem:[[SimpleMonster alloc] initWithX:200 andY:200]]; */
    
    
}

@end
