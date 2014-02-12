//
//  Score.h
//  TheRocket
//
//  Created by OdpiralniCasi on 04/02/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Headers.TheRocket.classes.h"
#import "SimpleMonster.h"

@interface Score : SuperLabel<ChangeScoreDelegate> {
    int point;
}

@end
