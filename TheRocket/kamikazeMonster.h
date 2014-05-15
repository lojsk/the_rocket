//
//  KamikazeMonster.h
//  TheRocket
//
//  Created by OdpiralniCasi on 19/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Headers.TheRocket.classes.h"

@interface KamikazeMonster : StateMonster {
    int firstY;
    float secTime;
}

- (id) initWithX:(int)x andY:(int)y andFirstY:(int)theFirstY andSecTime:(float)theSecTime;

@end
