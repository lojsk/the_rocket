//
//  Camera.h
//  TheRocket
//
//  Created by OdpiralniCasi on 27/11/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.Input.Touch.h"
#import "Headers.TheRocket.classes.h"

@interface Camera : GameComponent {
    Player *pinIt;
    Vector2 *lastPosition;
}

@property (nonatomic, readonly) Matrix *camera;

- (id) initWithGame:(Game*)theGame Object:(Player*)player;
@end
