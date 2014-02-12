//
//  GameProgress.h
//  friHockey
//
//  Created by Matej Jan on 22.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Headers.TheRocket.classes.h"

@interface GameProgress : NSObject <NSCoding> {
}

+ (GameProgress *) loadProgress;
+ (void) deleteProgress;
- (void) saveProgress;


@end
