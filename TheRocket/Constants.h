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

@property (nonatomic, readonly) float minimumBallVerticalVelocity;
@property (nonatomic, readonly) float maximumBallAngle;

@property (nonatomic, readonly) int startLives;
@property (nonatomic, readonly) float initialBallSpeed;
@property (nonatomic, readonly) float levelUpBallSpeedIncrease;

+ (Constants*) getInstance;

@end
