//
//  Score.m
//  TheRocket
//
//  Created by OdpiralniCasi on 04/02/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation Score

- (id) initWithVelocity:(Vector2*)theVelocity andLabel:(Label*)theLabel
{
	self = [super initWithVelocity:theVelocity andLabel:theLabel];
    if (self != nil) {
        point = 0;
        
        [Constants setScoreClass:self];
    }
	return self;
}

-(void)ChangeScore:(NSInteger)plus {
    point += plus;
    [label setText:[NSString stringWithFormat:@"%d",point]];
}




@end
