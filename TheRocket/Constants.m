//
//  Constants.m
//  Wall
//
//  Created by Matej Jan on 16.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Constants.h"

@implementation Constants

static Constants *instance;
static float gameSpeed = 100.0f;
static id score = nil;
static id customLevel;

+ (void) initialize {
	instance = [[Constants alloc] init];
}

+ (Constants *) getInstance {
	return instance;
}

// theRocket game
+ (float) numberOfBackgrounds {
	return 6;
}

+ (void) setGameSpeed:(float)gs {
    gameSpeed = gs;
}

+ (float) gameSpeed {
	return gameSpeed;
}

+(float) getLeftRightSpeed {
    return  40;
}

+(float) shotChange {
    return 0.2f;
}

+(float)bulletSpeed {
    return [Constants gameSpeed]+600.0f;
}

+(float)topEnemyLimit {
    return 200;
}

+(float)bottomEnemyLimit {
    return 960;
}

+(float)calculateMovment:(float)x withV:(float)v andTime:(float)time {
    return [[Vector2 vectorWithX:0.0f y:x] add:[Vector2 multiply:[Vector2 vectorWithX:0.0f y:-v] by:time]].y;
}

+ (NSString*) progressFilePath {
	return @"FriHockeySave";
}

+ (void) setScoreClass:(id)s {
    score = s;
}

+ (id)getScoreClass {
    return score;
}

+ (void)saveCustomLevel:(id)custom {
    customLevel =custom;
}

+ (id)loadCustomLevel {
    return customLevel;
}

+ (float)backgourndHeight {
    return 2560.0f;
}

@end
