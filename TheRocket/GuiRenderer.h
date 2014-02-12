//
//  GuiRenderer.h
//  friHockey
//
//  Created by Matej Jan on 20.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Express.Graphics.h"

#import "Headers.TheRocket.classes.h"

@interface GuiRenderer : DrawableGameComponent {
	SpriteBatch *spriteBatch;
	
	id<IScene> scene;
    
    // Camera
    Matrix *camera;
}

@property (nonatomic, readonly) Matrix *camera;

- (id) initWithGame:(Game*)theGame scene:(id<IScene>)theScene;

@end
