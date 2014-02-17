//
//  GameButton.h
//  TheRocket
//
//  Created by OdpiralniCasi on 30/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.classes.h"

@interface GameButton : Button <IMovable> {
}

- (id) initWithArea:(Rectangle*)theInputArea;

@end