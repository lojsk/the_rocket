//
//  AIMonsterModel.m
//  TheRocket
//
//  Created by OdpiralniCasi on 19/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation AIMonsterModel

-(id)initWithObject:(id<ISceneUser>)theObject {
    self = [super init];
	if (self != nil) {
        areas = [[NSMutableArray alloc] init];
        //[areas addObject:[[AIArea alloc] initWithObject:theObject]];
        [areas addObject:[[AIArea alloc] initWithDistance:[Vector2 vectorWithX:0 y:300] andObject:theObject]];
    }
    return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime andObject:(id<IMovable>)theObject {
    for(int i=0;i<[areas count];i++) {
        [[areas objectAtIndex:i] updatePosition:theObject];
    }
}

-(void) removeItems {
    for(int i=0;i<[areas count];i++) {
        [[areas objectAtIndex:i] removeItem];
    }
}


@end
