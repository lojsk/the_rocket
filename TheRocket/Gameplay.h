//
//  Gameplay.h
//  Wall
//
//  Created by Matej Jan on 15.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Express.Graphics.h"
#import "Headers.TheRocket.classes.h"
#import "GameState.h"

@interface Gameplay : GameState {
	Level *level;
	Physics *physics;
	Renderer *renderer;	
	DebugRenderer *debugRenderer;
	Player *player;
    Camera *camera;
    
    Score *score;
}
@property (nonatomic, readonly) Camera *camera;
@property (nonatomic, readonly) Level *level;
@property (nonatomic, readonly) int lives;

- (float) calculateCrrentBallSpeed;

@end
