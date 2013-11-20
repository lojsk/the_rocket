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

+ (void) initialize {
	instance = [[Constants alloc] init];
}

+ (Constants *) getInstance {
	return instance;
}

- (float) minimumBallVerticalVelocity {
	return 100;
}

- (float) maximumBallAngle {
	return M_PI / 2;
}

- (int) startLives {
	return 2;
}

- (float) initialBallSpeed {
	return 400;
}

- (float) levelUpBallSpeedIncrease {
	return 100;
}

@end
