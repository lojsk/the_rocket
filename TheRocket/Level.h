//
//  Level.h
//  FriHockey
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

#import "Headers.TheRocket.classes.h"
#import "Express.Scene.h"
#import "Artificial.Mirage.h"

@interface Level : GameComponent {
	SimpleScene *scene;
	
	Rocket *player;
    NSMutableArray *bgs;
    Background *bgA;
    Background *bgB;
    Background *bgC;
    
    //SwitchBackgorund *switchBg;
    float bottomLimit;
    HorizontalLine *horTopLine;
    HorizontalLine *horBottomLine;
    
    EnemyScene *enemyScene;
    BulletScene *bulletScene;
    World *stage;
    Shield *shield;
    
    SpriteFont *retrotype;
    GameButton *pause;
    Score *score;
    
    Gameplay *gameplay;
    CGSize screenSize;
    int coins;
}

@property (nonatomic, readonly) id<IScene> scene;
@property (nonatomic, readonly) Rocket *player;

- (id) initWithGame:(Game*)theGame gameplay:(Gameplay*)theGameplay;
-(void) pauseButtonClick;
- (void) endGame;

@end
