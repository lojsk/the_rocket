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
	rocketSprite.texture = [self.game.content load:@"01a"];
	rocketSprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:32 height:32];
	rocketSprite.origin = [Vector2 vectorWithX:16 y:16];
    rocketSprite.scale = 3;
    
    enemySprite = [[Sprite alloc] init];
	enemySprite.texture = [self.game.content load:@"01a"];
	enemySprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:32 height:32];
	enemySprite.origin = [Vector2 vectorWithX:16 y:16];
    enemySprite.scale = 3;
/*
    enemy1Sprite = [[Sprite alloc] init];
	enemy1Sprite.texture = [self.game.content load:@"01c"];
	enemy1Sprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:96 height:96];
	enemy1Sprite.origin = [Vector2 vectorWithX:48 y:48];
    enemy1Sprite.scale = 1;
    
    enemy2Sprite = [[Sprite alloc] init];
	enemy2Sprite.texture = [self.game.content load:@"01d"];
	enemy2Sprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:24 height:24];
	enemy2Sprite.origin = [Vector2 vectorWithX:12 y:12];
    enemy2Sprite.scale = 4;
 
    enemy3Sprite = [[Sprite alloc] init];
	enemy3Sprite.texture = [self.game.content load:@"01d"];
	enemy3Sprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:32 height:32];
	enemy3Sprite.origin = [Vector2 vectorWithX:16 y:16];
    enemy3Sprite.scale = 3;
*/
    
    bgElSpriteA = [[Sprite alloc] init];
    bgElSpriteA.texture = [self.game.content load:@"level01aT"];
    bgElSpriteA.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:160 height:640];
    bgElSpriteA.origin = [Vector2 vectorWithX:0 y:0];
    bgElSpriteA.scale = 4;
    
    bottomLine = [[Sprite alloc] init];
    bottomLine.texture = [self.game.content load:@"bottomLine"];
    bottomLine.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:160 height:47];
    bottomLine.origin = [Vector2 vectorWithX:0 y:0];
    bottomLine.scale = 4;
    
    bgElSpriteB = [[Sprite alloc] init];
    bgElSpriteB.texture = [self.game.content load:@"level01b"];
    bgElSpriteB.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:160 height:640];
    bgElSpriteB.origin = [Vector2 vectorWithX:0 y:0];
    bgElSpriteB.scale = 4;
    
    bgElSpriteC = [[Sprite alloc] init];
    bgElSpriteC.texture = [self.game.content load:@"level01c"];
    bgElSpriteC.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:160 height:640];
    bgElSpriteC.origin = [Vector2 vectorWithX:0 y:0];
    bgElSpriteC.scale = 4;
    
    bgSwitchElSprite = [[Sprite alloc] init];
    bgSwitchElSprite.texture = [self.game.content load:@"level02a"];
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
    explosionSpriteAnimation = [[AnimatedSprite alloc] initWithDuration:1.0f];
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
                      SamplerState:[SamplerState pointClamp]
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
            if(bg.layer == 0) {
                sprite = bgElSpriteA;
            } else if(bg.layer == 1) {
                sprite = bgElSpriteB;
            } else if(bg.layer == 2) {
                sprite = bgElSpriteC;
            }
          //  NSString *level = [NSString stringWithFormat:@"level%d", bg.levelIMG];
          //  bgElSprite.texture = [self.game.content load:level];
            
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
            SimpleMonster *sm = (SimpleMonster*)item;
            sprite = enemySprite;
          /*  switch (sm.spriteID) {
                case 0:
                    sprite = enemySprite;
                    break;
                case 1:
                    sprite = enemy1Sprite;
                    break;
                case 2:
                    sprite = enemy2Sprite;
                    break;
            } */
            sprite.rotation = M_PI;
        } else if([item isKindOfClass:[Explosion class]]) {
            Explosion *ex = (Explosion*)item;
            explosionSpriteAnimation.duration = ex.lifetime.duration;
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
        } else if([item isKindOfClass:[HorizontalLineRemoveEnemy class]]) {
            sprite = bottomLine;
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

