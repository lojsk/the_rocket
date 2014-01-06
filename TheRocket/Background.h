//
//  Background.h
//  TheRocket
//
//  Created by OdpiralniCasi on 08/12/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.h"

@interface Background : NSObject<IPosition> {
    Vector2 *position;
    int levelIMG;
}

@property (nonatomic, readwrite) int levelIMG;

@end
