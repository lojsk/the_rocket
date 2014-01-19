//
//  EnemyLevel.h
//  TheRocket
//
//  Created by OdpiralniCasi on 06/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.h"

@interface EnemyLevel : NSObject {
    NSMutableArray *levelArray;
}

@property (nonatomic, readonly) NSMutableArray *levelArray;


- (void) initialize;

@end
