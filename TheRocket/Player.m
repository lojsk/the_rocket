//
//  Player.m
//  Wall
//
//  Created by Matej Jan on 15.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Player.h"

#import "Headers.TheRocket.h"

@implementation Player

- (id) initWithGame:(Game*)theGame Rocket:(Rocket *)theRocket Scene:(SimpleScene *)theScene
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		rocket= theRocket;
        motionManager = [[CMMotionManager alloc] init];
        referenceAttitude = nil;
        speed = [Constants getLeftRightSpeed];
        [self setupGyro];
        [self startGyro];
        scene = theScene;
	}
	return self;
}

- (void) setupGyro {
    motionManager = [[CMMotionManager alloc] init];
    [motionManager startDeviceMotionUpdates];
}

-(void) startGyro {
    CMDeviceMotion *deviceMotion = motionManager.deviceMotion;
    CMAttitude *attitude = deviceMotion.attitude;
    referenceAttitude   = attitude;
}

@synthesize rocket, scene;

- (void) setCamera:(Matrix *)camera {
    //NSLog(@"%@ ----", camera);
	inverseView = camera;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // gyro for moving left and right
    if(!referenceAttitude) {
        [self startGyro];
    }
    if(referenceAttitude) {
        [motionManager.deviceMotion.attitude multiplyByInverseOfAttitude: referenceAttitude];
        double rRotation = motionManager.deviceMotion.attitude.roll*180/M_PI;
        rocket.position.x = 320 + rRotation * speed;
    }
    
    // shot
    TouchCollection *touches = [TouchPanel getState];
	if ([touches count] == 1 && gameTime.totalGameTime - lastShot  > [Constants shotChange]) {
        [scene addItem:[[Bullet alloc] initWithPosition:rocket.position andGame:self.game]];
        lastShot = gameTime.totalGameTime;
	}
    
    rocket.position.y -= [Constants gameSpeed];
}

- (BOOL) collidingWithItem:(id)item{
    return YES;
}

- (void) collidedWithItem:(id)item{

}



@end
