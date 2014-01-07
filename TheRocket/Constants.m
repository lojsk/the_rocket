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

// theRocket game
+ (float) numberOfBackgrounds {
	return 3;
}

+ (float) gameSpeed {
	return 5;
}

+(float) getLeftRightSpeed {
    return  15;
}

+(float) shotChange {
    return 0.2f;
}

+(float)bulletSpeed {
    return [Constants gameSpeed]*2;
}


@end
