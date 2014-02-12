//
//  GameState.h
//  friHockey
//
//  Created by Matej Jan on 22.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Headers.TheRocket.classes.h"
#import "Express.Scene.h"

@interface GameState : GameComponent {
	TheRocket *theRocket;
}

@property (nonatomic, readonly) TheRocket *theRocket;

- (void) activate;
- (void) deactivate;

@end
