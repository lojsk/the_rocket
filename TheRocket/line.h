//
//  line.h
//  TheRocket
//
//  Created by OdpiralniCasi on 08/12/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.h"


@interface line : NSObject<IPosition> {
    Vector2 *position;
    bool topLine;
}

@property bool topLine;

@end
