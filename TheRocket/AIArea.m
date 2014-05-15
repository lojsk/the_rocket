//
//  AIArea.m
//  TheRocket
//
//  Created by OdpiralniCasi on 22/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import "Headers.TheRocket.h"

@implementation AIArea

- (id) initWithObject:(id<ISceneUser>)theObject
{
    self = [super init];
	if (self != nil) {
        position = [Vector2 zero];
        velocity = [Vector2 zero];
        distance = [Vector2 zero];
        
        radius = 20;
        mass = 10;
        setID = [NSSet setWithObjects: [SimpleMonster class], [SimpleMonster class], nil];
        directionVel = YES;

        [self setObject:theObject];
    }
	return self;
}

- (id) initWithDistance:(Vector2*)theDistance andObject:(id<ISceneUser>)theObject
{
    self = [super init];
	if (self != nil) {
        position = [Vector2 zero];
        velocity = [Vector2 zero];
        
        distance = theDistance;
        
        radius = 20;
        mass = 10;
        setID = [NSSet setWithObjects: [Bullet class], nil];
        directionVel = NO;
        
        [self setObject:theObject];
    }
	return self;
}

-(void) setObject:(id<ISceneUser>)theObject {
    cObject = theObject;
    scena = theObject.scene;
    [scena addItem:self];
}

@synthesize position, radius, mass, setID, velocity;

-(void)updatePosition:(id<IMovable>)object {
    if(directionVel) {
       // distance = [Vector2 multiply:[Vector2 normalize:[Vector2 vectorWithX:object.velocity.x y:velocity.y+[Constants gameSpeed]]] by:50];
        distance = [Vector2 multiply:[Vector2 normalize:[Vector2 vectorWithX:object.velocity.x y:velocity.y+0]] by:50];
    }
    position = [Vector2 vectorWithX:object.position.x + distance.x y:object.position.y + distance.y];
}

-(void)removeItem {
    [scena removeItem:self];
}

- (BOOL) collidingWithItem:(id)item {
    return YES;
}

- (void) collidedWithItem:(id)item {
    [scene removeItem:self];
    
    id<IAIModal> AI = [cObject conformsToProtocol:@protocol(IAIModal)] ? cObject : nil;
    if(AI) {
       [AI bulletAvoid];
    }
}

@end
