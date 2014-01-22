//
//  BulletScene.h
//  TheRocket
//
//  Created by OdpiralniCasi on 19/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.classes.h"

// EnemyScene : VerticalLine<ISceneUser, ICustomUpdate, ICustomCollider> 
@interface BulletScene : NSObject<ICustomUpdate, ISceneUser> {
    Rocket *player;
    Game *game;
    float shotTime;
    float lastShotTime;
    NSMutableArray *bullets;
}

- (id) initWithRocket:(Rocket*)r andGame:(Game*)theGame;
    
@end
