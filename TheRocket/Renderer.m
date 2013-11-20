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

- (id) initWithGame:(Game *)theGame gameplay:(Gameplay*)theGameplay {
	if (self = [super initWithGame:theGame]) {
		gameplay = theGameplay;
	}
	return self;
}

@synthesize camera;

- (void) initialize {
   // float scaleX = (float)self.game.window.clientBounds.width / (float)gameplay.level.bounds.width;
//	float scaleY = (float)self.game.window.clientBounds.height / (float)gameplay.level.bounds.height;
    float scaleX = 400.0f;
    float scaleY = 500.0f;
	camera = [Matrix createScale:[Vector3 vectorWithX:scaleX y:scaleY z:1]];
    
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
	
	for (id item in gameplay.level.scene) {
		
		id <IPosition> itemWithPosition = [item conformsToProtocol:@protocol(IPosition)] ? item : nil;
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

