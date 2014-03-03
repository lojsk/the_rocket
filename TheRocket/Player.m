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
        
        screenSize = [[UIScreen mainScreen] bounds].size;
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

@synthesize rocket, scene, velocity, position;

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
        rocket.velocity.x = rRotation * speed;
        
        if(rocket.velocity.x > 800)
            rocket.velocity.x = 800;
        if(rocket.velocity.x < -800)
            rocket.velocity.x = -800;
        
        if(rocket.position.x < 40) {
            rocket.position.x = 40;
          //  rocket.velocity.x = 0;
        }
        if(rocket.position.x > screenSize.width*2-40) {
            rocket.position.x = screenSize.width*2-40;
        //    rocket.velocity.x = 0;
        }
        /*

        
        // min
        if(rocket.velocity.x > 0 && rocket.velocity.x < 40)
            rocket.velocity.x = 0;
        if(rocket.velocity.x < 0 && rocket.velocity.x > -40)
            rocket.velocity.x = 0;
*/
        
        //rocket.position.x = 320 + rRotation * speed;
    }
}

- (BOOL) collidingWithItem:(id)item{
    return YES;
}

- (void) collidedWithItem:(id)item{

}



@end
