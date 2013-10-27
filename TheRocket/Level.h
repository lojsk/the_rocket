//
//  Level.h
//  FriHockey
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Headers.TheRocket.classes.h"

@interface Level : NSObject {
	Scene *scene;
	
	Rocket *player;
}

@property (nonatomic, retain) Scene *scene;

@end
