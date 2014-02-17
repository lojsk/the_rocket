//
//  SimpleMonster.h
//  TheRocket
//
//  Created by OdpiralniCasi on 06/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.classes.h"

//delegate to return amount entered by the user
@protocol ChangeScoreDelegate <NSObject>

-(void)ChangeScore:(NSInteger)plus;

@end

@interface SimpleMonster : NSObject <IParticle, ICollisionID, ICustomCollider, ISceneUser, IGetCordinate> {
	Vector2 *position;
	Vector2 *velocity;
	float radius;
	float mass;
    float live;

    
}

- (id) initWithX:(int)x andY:(int)y;
- (id) initWithX:(int)x Y:(int)y andVelocityY:(int)vY;

@property (nonatomic, weak) id <ChangeScoreDelegate> delegateS;

@end
