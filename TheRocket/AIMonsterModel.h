//
//  AIMonsterModel.h
//  TheRocket
//
//  Created by OdpiralniCasi on 19/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.classes.h"

@interface AIMonsterModel : NSObject  {
    NSMutableArray *areas;
}

- (id)initWithObject:(id<ISceneUser>)theObject;
- (void) updateWithGameTime:(GameTime *)gameTime andObject:(id<IMovable>)theObject;
-(void) removeItems;

@end
