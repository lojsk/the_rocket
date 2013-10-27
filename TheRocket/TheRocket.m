//
//  TheRocket.m
//  TheRocket
//
//  Created by OdpiralniCasi on 27/10/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import "TheRocket.h"

@implementation TheRocket

- init {
    self = [super init];
    if(self) {
        graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
    }
    return self;
}

- (void)drawWithGameTime:(GameTime *)gameTime {
    [self.graphicsDevice clearWithColor:[Color cornflowerBlue]];
    [super drawWithGameTime:gameTime];
}


@end
