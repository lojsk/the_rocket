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
        screenSize = [[UIScreen mainScreen] bounds].size;
        topScreen = 0;
        count = 20;
        height = screenSize.height*2 / (count-1);
        
        moreCell =  [[NSMutableArray alloc] init];
        grid = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    
    // set to default
    grid = [[NSMutableArray alloc] init];
    moreCell = [[NSMutableArray alloc] init];
    
    // update cordinate in grid
    for (int j=0;j<count-1;j++) {
        [grid insertObject:[[NSMutableArray alloc] init] atIndex:j];
    }
    
    for (id item in level.scene) {
		id<IGetCordinate> updatable = [item conformsToProtocol:@protocol(IGetCordinate)] ? item : nil;
		if (updatable) {
			[self getCurrentCordinate:updatable];
		} else if([item conformsToProtocol:@protocol(IMoreCell)] ? item : nil) {
            [moreCell addObject:item];
        }
	}
     
    // Movement
	for (id item in level.scene) {
		[MovementPhysics simulateMovementOn:item withElapsed:gameTime.elapsedGameTime];
	}

    for(NSMutableArray *group in grid) {
        int i = 0;
        for(id item1 in group) {
            id <ICollisionID> itemC1 = [item1 conformsToProtocol:@protocol(ICollisionID)] ? item1 : nil;
            if ([item1 conformsToProtocol:@protocol(ICollisionID)]) {
                itemC1 = (id<ICollisionID>)item1;
            } else {
                continue;
            }
            
            int j = 0;
            for(id item2 in group) {
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
    
    for(id item1 in level.scene) {
        id <ICollisionID> itemC1 = [item1 conformsToProtocol:@protocol(ICollisionID)] ? item1 : nil;
        if ([item1 conformsToProtocol:@protocol(ICollisionID)]) {
            itemC1 = (id<ICollisionID>)item1;
        } else {
            continue;
        }
        for(id item2 in moreCell) {
            if ([itemC1.setID containsObject:[item2 class]]) {
                [Collision collisionBetween:item1 and:item2];
            }
        }
    }
    
   // topScreen = [Constants calculateMovment:topScreen withV:[Constants gameSpeed] andTime:gameTime.elapsedGameTime];
    topScreen = [Constants calculateMovment:topScreen withV:0 andTime:gameTime.elapsedGameTime];
}

-(void) getCurrentCordinate:(id<IGetCordinate>)item {
    for(int i=0;i<[grid count];i++) {
        if(topScreen + height * i <= item.position.y && item.position.y < topScreen + height * (i+1)) {
            [[grid objectAtIndex:i] addObject:item];
        }
    }
}

@end
