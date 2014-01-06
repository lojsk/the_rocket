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
	camera = [Matrix createTranslationX:0 y:0 z:0];
	[super initialize];
    
    retina = NO;
    scale = 0.5;
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && [UIScreen mainScreen].scale == 2.0) {
        retina = YES;
        scale = 1;
    }
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    screenSize = screenBound.size;
}

- (void) loadContent {
	spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
	
	rocketSprite = [[Sprite alloc] init];
	rocketSprite.texture = [self.game.content load:@"ME"];
	rocketSprite.sourceRectangle = [Rectangle rectangleWithX:55 y:55 width:55 height:55];
	rocketSprite.origin = [Vector2 vectorWithX:27.5 y:27.5];
    rocketSprite.scale = 1;
    
    bgElSprite = [[Sprite alloc] init];
    bgElSprite.texture = [self.game.content load:@"level0"];
    bgElSprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:350 height:350];
    bgElSprite.origin = [Vector2 vectorWithX:0 y:0];
    bgElSprite.scale = 2;
    
    bgSwitchElSprite = [[Sprite alloc] init];
    bgSwitchElSprite.texture = [self.game.content load:@"level6s"];
    bgSwitchElSprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:350 height:350];
    bgSwitchElSprite.origin = [Vector2 vectorWithX:0 y:0];
    bgSwitchElSprite.scale = 2;
    bgSwitchElSprite.z = 1;
    
    lineSprite = [[Sprite alloc] init];
    lineSprite.texture = [self.game.content load:@"level3"];
    lineSprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:700 height:10];
    lineSprite.origin = [Vector2 vectorWithX:0 y:0];
    lineSprite.scale = 1;
    
    verticalLineSprite = [[Sprite alloc] init];
    verticalLineSprite.texture = [self.game.content load:@"level4"];
    verticalLineSprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:10 height:1024];
    verticalLineSprite.origin = [Vector2 vectorWithX:0 y:0];
    verticalLineSprite.scale = 1;
    
    bulletSprite = [[Sprite alloc] init];
    bulletSprite.texture = [self.game.content load:@"bullet"];
    bulletSprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:50 height:50];
    bulletSprite.origin = [Vector2 vectorWithX:25 y:25];
    bulletSprite.scale = 0.20f;
}

- (void) drawWithGameTime:(GameTime *)gameTime {
	[self.graphicsDevice clearWithColor:[Color blue]];
	
	[spriteBatch beginWithSortMode:SpriteSortModeDeffered
                        BlendState:nil
                      SamplerState:nil
				 DepthStencilState:nil
                   RasterizerState:nil
                            Effect:nil
                   TransformMatrix:gameplay.camera.camera];
    
	for (id item in gameplay.level.scene) {
		
		id <IPosition> itemWithPosition = [item conformsToProtocol:@protocol(IPosition)] ? item : nil;
		if ([item conformsToProtocol:@protocol(Position)]) {
			itemWithPosition = (id<Position>)item;
		}
		
		Sprite *sprite;
		if ([item isKindOfClass:[Rocket class]]) {
			sprite = rocketSprite;
		} else if([item isKindOfClass:[Background class]]) {
            Background *bg = (Background*)item;
            NSString *level = [NSString stringWithFormat:@"level%d", bg.levelIMG];
            bgElSprite.texture = [self.game.content load:level];
            sprite = bgElSprite;
        } else if([item isKindOfClass:[line class]]) {
            sprite = lineSprite;
        } else if([item isKindOfClass:[SwitchBackgorund class]]) {
            SwitchBackgorund *sBG = (SwitchBackgorund*)item;
            NSString *level = [NSString stringWithFormat:@"level%ds", sBG.currentLevel];
            bgSwitchElSprite.texture = [self.game.content load:level]; 
            sprite = bgSwitchElSprite;
        } else if([item isKindOfClass:[Bullet class]]) {
            sprite = bulletSprite;
        }
		
		if (itemWithPosition && sprite) {
			[spriteBatch draw:sprite.texture
						   to:itemWithPosition.position
				fromRectangle:sprite.sourceRectangle
				tintWithColor:[Color white]
					 rotation:0
					   origin:sprite.origin
				 scaleUniform:scale * sprite.scale
					  effects:SpriteEffectsNone
				   layerDepth:0];
		}
	}
	
	[spriteBatch end];
}


@end

