//
//  SuperLabel.h
//  TheRocket
//
//  Created by OdpiralniCasi on 04/02/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.Objects.h"

#import "Headers.TheRocket.classes.h"

@interface SuperLabel : NSObject<IMovable> {
    Label *label;
}

@property (nonatomic, strong) Label *label;

- (id) initWithVelocity:(Vector2*)theVelocity andLabel:(Label*)theLabel;
- (void) setText:(NSString*)theText;

@end
