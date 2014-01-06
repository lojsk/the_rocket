//
//  VerticalLine.h
//  TheRocket
//
//  Created by OdpiralniCasi on 26/12/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"
#import "Express.Math.h"

#import "Headers.TheRocket.h"


@interface VerticalLine : NSObject<IAAHalfPlaneCollider, ICollisionID> {
	AAHalfPlane *limit;
}

- (id) initWithLimit:(AAHalfPlane*)theLimit;

@end