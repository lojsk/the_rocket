//
//  TheRocket.h
//  TheRocket
//
//  Created by OdpiralniCasi on 27/10/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Input.Touch.h"

@interface TheRocket : Game {
    GraphicsDeviceManager *graphics;
}

- (void)drawWithGameTime:(GameTime *)gameTime;

@end
