//
//  AIMonsterModel.m
//  TheRocket
//
//  Created by OdpiralniCasi on 19/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation AIMonsterModel

-(void)initWithPosition:(Vector2*)thePosition andVelocity:(Vector2 *)theVelocity andScene:(id<Scene>)theScene {
    [[AIArea alloc] initWithPosition:thePosition direction:theVelocity andDistance:5];
    [[AIArea alloc] initWithPosition:thePosition direction:[Vector2 vectorWithX:0 y:50] andDistance:50];
}

@end
