//
//  Physics.h
//  Wall
//
//  Created by Matej Jan on 15.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Headers.TheRocket.classes.h"

@interface Physics : GameComponent {
	Level *level;
    CGSize screenSize;
    float topScreen;
    NSMutableArray *grid;
    float count;
    float height;
    NSMutableArray *moreCell;
}

- (id) initWithGame:(Game*)theGame level:(Level*)theLevel;

@end
