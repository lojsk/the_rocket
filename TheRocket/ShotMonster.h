//
//  ShotMonster.h
//  TheRocket
//
//  Created by OdpiralniCasi on 16/02/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Headers.TheRocket.classes.h"

@interface ShotMonster : StateMonster {
    Bullet *bullet;
    Game *game;
    int bulletNum;
    int currentBullet;
}

- (void) setGame:(Game*)theGame;

@end
