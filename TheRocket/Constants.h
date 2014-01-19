//
//  Constants.h
//  Wall
//
//  Created by Matej Jan on 16.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Constants : NSObject {
}

+ (Constants*) getInstance;

// theRocket Game
+ (float) numberOfBackgrounds;
+ (float) gameSpeed;
+ (float) getLeftRightSpeed;
+ (float) shotChange;
+(float)bulletSpeed;
+(float)topEnemyLimit;
+(float)bottomEnemyLimit;

@end
