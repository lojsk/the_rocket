//
//  Renderer.m
//  TheRocket
//
//  Created by OdpiralniCasi on 27/10/13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import "Renderer.h"
#import "Headers.TheRocket.h"

@implementation Renderer

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
	if (self = [super initWithGame:theGame]) {
		level = theLevel;
	}
	return self;
}

- (void) initialize {
    
	[super initialize];
}

- (void) loadContent {
	spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
	
	malletSprite = [[Sprite alloc] init];
	malletSprite.texture = [self.game.content load:@"SceneItems"];
	malletSprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:60 height:60];
	malletSprite.origin = [Vector2 vectorWithX:30 y:30];
	
	puckSprite = [[Sprite alloc] init];
	puckSprite.texture = [self.game.content load:@"SceneItems"];
	puckSprite.sourceRectangle = [Rectangle rectangleWithX:80 y:0 width:40 height:40];
	puckSprite.origin = [Vector2 vectorWithX:20 y:20];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
	[self.graphicsDevice clearWithColor:[Color white]];
	
	[spriteBatch begin];
	
	for (id<NSObject> item in level.scene) {
		
		id<Position> itemWithPosition;
		if ([item conformsToProtocol:@protocol(Position)]) {
			itemWithPosition = (id<Position>)item;
		}
		
		Sprite *sprite;
		if ([item isKindOfClass:[Mallet class]]) {
			sprite = malletSprite;
		} 
		
		if (itemWithPosition && sprite) {
			[spriteBatch draw:sprite.texture
						   to:itemWithPosition.position
				fromRectangle:sprite.sourceRectangle
				tintWithColor:[Color white]
					 rotation:0
					   origin:sprite.origin
				 scaleUniform:2
					  effects:SpriteEffectsNone
				   layerDepth:0];
		}
	}
	
	[spriteBatch end];
}


@end

