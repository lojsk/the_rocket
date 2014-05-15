//
//  HorizontalLineRemoveEnemy.h
//  TheRocket
//
//  Created by lojsk on 15/05/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.classes.h"

@interface HorizontalLineRemoveEnemy : HorizontalLine<IGetCordinate, ICustomCollider>

//@property (nonatomic, retain) Vector2 *position;

- (id) initWithLimit:(AAHalfPlane *)theLimit setID:(NSSet*)theSet andPosition:(Vector2*)thePosition;


@end
