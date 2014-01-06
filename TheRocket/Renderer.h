//
//  Renderer.h
//  TheRocket
//
//  Created by OdpiralniCasi on 27/10/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Express.Graphics.h"

#import "Headers.TheRocket.classes.h"

@interface Renderer : DrawableGameComponent {
	// Resources
	Sprite *rocketSprite;
    Sprite *bgElSprite;
    Sprite *bgSwitchElSprite;
    Sprite *lineSprite;
    Sprite *verticalLineSprite;
    Sprite *bulletSprite;
	
	// Graphics objects
	SpriteBatch *spriteBatch;
	
	// Level
	Gameplay *gameplay;
	Matrix *camera;
    
    BOOL retina;
    float scale;
    
    CGSize screenSize;
}

- (id) initWithGame:(Game*)theGame gameplay:(Gameplay*)theGameplay;

@property (nonatomic, readonly) Matrix *camera;
@end
