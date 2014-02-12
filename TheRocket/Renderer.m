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
        camera = [Matrix createTranslationX:0 y:0 z:0];
        retina = NO;
        scale = 0.5;
        if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && [UIScreen mainScreen].scale == 2.0) {
            retina = YES;
            scale = 1;
        }
        
        CGRect screenBound = [[UIScreen mainScreen] bounds];
        screenSize = screenBound.size;
	}
	return self;
}

@synthesize camera;

- (void) initialize {
	
	[super initialize];
    
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
    
    shieldSprite = [[Sprite alloc] init];
    shieldSprite.texture = [self.game.content load:@"shield"];
    shieldSprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:250 height:250];
    shieldSprite.origin = [Vector2 vectorWithX:125 y:125];
    shieldSprite.scale = 0.25f;
    shieldSprite.z = 0.5f;
    
    pauseSprite = [[Sprite alloc] init];
    pauseSprite.texture = [self.game.content load:@"pause"];
    pauseSprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:265 height:265];
    pauseSprite.origin = [Vector2 vectorWithX:0 y:0];
    pauseSprite.scale = 0.25f;
    pauseSprite.z = 0.5f;
    
    // explosion
    // explosion
    Texture2D *explosionTexture = [self.game.content load:@"explosion"];
    explosionSpriteAnimation = [[AnimatedSprite alloc] initWithDuration:0.5];
    explosionSpriteAnimation.looping = NO;
    for (int i = 0; i < 25; i++) {
        int row = i / 5;
        int column = i % 5;
        Sprite *sprite = [[Sprite alloc] init];
        sprite.texture = explosionTexture;
        sprite.sourceRectangle = [Rectangle rectangleWithX:column * 64 y:row * 64 width:64 height:64];
        sprite.origin = [Vector2 vectorWithX:32 y:32];
        sprite.scale = 2;
        sprite.z = 1;
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:sprite start:explosionSpriteAnimation.duration * (float)i / 25];
        [explosionSpriteAnimation addFrame:frame];
    } 
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
        Label *label;
		if ([item isKindOfClass:[Rocket class]]) {
			sprite = rocketSprite;
            sprite.rotation = 0;
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
        } else if([item isKindOfClass:[SimpleMonster class]]) {
            sprite = rocketSprite;
            sprite.rotation = M_PI;
        } else if([item isKindOfClass:[Explosion class]]) {
            Explosion *ex = (Explosion*)item;
            sprite = [explosionSpriteAnimation spriteAtTime:ex.lifetime.progress];
        } else if([item isKindOfClass:[Shield class]]) {
            sprite = shieldSprite;
        } else if([item isKindOfClass:[AIArea class]]) {
           // sprite = shieldSprite;
        } else if([item isKindOfClass:[GameButton class]]) {
           // [spriteBatch draw:image.texture to:image.position fromRectangle:image.sourceRectangle tintWithColor:image.color
			//		 rotation:image.rotation origin:image.origin scale:image.scale effects:SpriteEffectsNone layerDepth:image.layerDepth];
            sprite = pauseSprite;
        } else if([item isKindOfClass:[SuperLabel class]]) {
            sprite = nil;
            label = ((SuperLabel*)item).label;
        }
		
		if (itemWithPosition && sprite) {
			[spriteBatch draw:sprite.texture
						   to:itemWithPosition.position
				fromRectangle:sprite.sourceRectangle
				tintWithColor:[Color white]
					 rotation:sprite.rotation
					   origin:sprite.origin
				 scaleUniform:scale * sprite.scale
					  effects:SpriteEffectsNone
				   layerDepth:sprite.z];
		} else if(label) {
            [spriteBatch drawStringWithSpriteFont:label.font text:label.text to:label.position tintWithColor:label.color
										 rotation:label.rotation origin:label.origin scale:label.scale effects:SpriteEffectsNone layerDepth:label.layerDepth];
        }
	}
	
	[spriteBatch end];
}


@end

