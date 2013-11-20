//
//  Mallet.h
//  FriHockey
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.h"

@interface Rocket : NSObject <IAARectangleCollider, ICustomCollider> {
    Vector2 *position;
}

@end
