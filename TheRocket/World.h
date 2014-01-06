//
//  World.h
//  TheRocket
//
//  Created by OdpiralniCasi on 08/12/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.h"

@interface World : NSObject {
    int worldIMG;
    NSMutableArray *worldLimit;
    int mSwitch;
}

@property NSMutableArray *worldLimit;
@property int mSwitch;

@end
