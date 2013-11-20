//
//  Level.h
//  FriHockey
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Headers.TheRocket.classes.h"
#import "Express.Scene.h"

@interface Level : GameComponent {
	SimpleScene *scene;
	
	Rocket *player;
}

@property (nonatomic, readonly) id<IScene> scene;

@property (nonatomic, readonly) Rocket *player;

@end
