//
//  TheRocket.h
//  TheRocket
//
//  Created by OdpiralniCasi on 27/10/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Input.Touch.h"
#import "Headers.TheRocket.classes.h"

@interface TheRocket : Game {
    GraphicsDeviceManager *graphics;
	Renderer *renderer;
	Level *theLevel;
    
    GameProgress *progress;
    NSMutableArray *stateStack;
}

@property (nonatomic, readonly) GameProgress *progress;

- (void) loadLevel:(Level*) level;

- (void) pushState:(GameState*)gameState;
- (void) popState;

@end
