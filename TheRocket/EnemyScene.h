//
//  EnemyScene.h
//  TheRocket
//
//  Created by OdpiralniCasi on 11/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.h"


@interface EnemyScene : VerticalLine<ISceneUser, ICustomUpdate, ICustomCollider> {
    id<IScene> scene;
    EnemyLevel *enemyLevel;
    float topLine;
}

- (id) initWithScene:(id<IScene>)theScene topLimit:(float)tl andBottomLimit:(AAHalfPlane *)theLimit;

@end
