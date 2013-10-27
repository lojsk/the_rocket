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
	
	rocketSprite = [[Sprite alloc] init];
	rocketSprite.texture = [self.game.content load:@"ME"];
	rocketSprite.sourceRectangle = [Rectangle rectangleWithX:55 y:55 width:55 height:55];
	rocketSprite.origin = [Vector2 vectorWithX:27.5 y:27.5];
	
}

- (void) drawWithGameTime:(GameTime *)gameTime {
	[self.graphicsDevice clearWithColor:[Color blue]];
	
	[spriteBatch begin];
	
	for (id<NSObject> item in level.scene) {
		
		id<Position> itemWithPosition;
		if ([item conformsToProtocol:@protocol(Position)]) {
			itemWithPosition = (id<Position>)item;
		}
		
		Sprite *sprite;
		if ([item isKindOfClass:[Rocket class]]) {
			sprite = rocketSprite;
		} 
		
		if (itemWithPosition && sprite) {
			[spriteBatch draw:sprite.texture
						   to:itemWithPosition.position
				fromRectangle:sprite.sourceRectangle
				tintWithColor:[Color white]
					 rotation:0
					   origin:sprite.origin
				 scaleUniform:1
					  effects:SpriteEffectsNone
				   layerDepth:0];
		}
	}
	
	[spriteBatch end];
}


@end

