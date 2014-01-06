//
//  SwitchBackgorund.h
//  TheRocket
//
//  Created by OdpiralniCasi on 25/12/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.h"

@interface SwitchBackgorund : NSObject<IPosition> {
    Vector2 *position;
}

@property (nonatomic, readwrite) int currentLevel;

@end
