//
//  Physics.m
//  Wall
//
//  Created by Matej Jan on 15.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Physics.h"

#import "Express.Physics.h"

#import "Headers.TheRocket.h"

@implementation Physics

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
	if (self = [super initWithGame:theGame]) {
		level = theLevel;
	}
	return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	// Movement
	for (id item in level.scene) {
        if ([item isKindOfClass:[Player class]])
        {
        }
        
		[MovementPhysics simulateMovementOn:item withElapsed:gameTime.elapsedGameTime];
	}
	
    int i = 0;
	for (id item1 in level.scene) {
        int j = 0;
        
        id <ICollisionID> itemC1 = [item1 conformsToProtocol:@protocol(ICollisionID)] ? item1 : nil;
        if ([item1 conformsToProtocol:@protocol(ICollisionID)]) {
            itemC1 = (id<ICollisionID>)item1;
        }
        
        for (id item2 in level.scene) {
            if(j>=i) {
                if ([itemC1.setID containsObject:[item2 class]]) {
                    [Collision collisionBetween:item1 and:item2];
                }
            }
            j++;
        }
        i++;
	}
}

@end
