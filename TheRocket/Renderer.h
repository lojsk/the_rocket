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

#import "Headers.TheRocket.classes.h"

@interface Renderer : DrawableGameComponent {
	// Resources
	Sprite *rocketSprite;
	
	// Graphics objects
	SpriteBatch *spriteBatch;
	
	// Level
	Level *level;
}

- (id) initWithGame:(Game*)theGame level:(Level*)theLevel;

@end
