//
//  MainMenu.m
//  friHockey
//
//  Created by Matej Jan on 21.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "MainMenu.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Headers.TheRocket.h"

@implementation MainMenu

- (void) initialize {
	[super initialize];
	
	// Background
	Texture2D *tableTexture = [self.game.content load:@"level4"];
	backgorund = [[Image alloc] initWithTexture:tableTexture position:[Vector2 vectorWithX:-60 y:0]];
	[backgorund setScaleUniform: 4];
	[scene addItem:backgorund];
    
    // Buttons
    planet = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:100 y:400 width:buttonBackground.width height:buttonBackground.height] background:buttonBackground];
	[planet.backgroundImage setScaleUniform:0.4];
	[scene addItem:planet];
	
    buy = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:100 y:100 width:buttonBackground.width height:buttonBackground.height] background:buttonBackground];
	[buy.backgroundImage setScaleUniform:0.6];
	[scene addItem:buy];
	
	// Text
    /*

     title = [[Label alloc] initWithFont:retrotype text:@"friHockey" position:[Vector2 vectorWithX:160 y:10]];
     title.horizontalAlign = HorizontalAlignCenter;
     [scene addItem:title];
     
     subtitle = [[Label alloc] initWithFont:fivexfive text:@"by Matej Jan" position:[Vector2 vectorWithX:320 y:50]];
     subtitle.horizontalAlign = HorizontalAlignRight;
     [scene addItem:subtitle];
     
	subtitle = [[Label alloc] initWithFont:fivexfive text:@"by Matej Jan" position:[Vector2 vectorWithX:320 y:50]];
	subtitle.horizontalAlign = HorizontalAlignRight;
	[scene addItem:subtitle];
	
	copyright = [[Label alloc] initWithFont:fivexfive text:@""
				 "3D modeling by\n"
				 "Matjaz Lamut\n"
				 "Published by GameTeam, Fri\n"
				 "Copyright 2011 Razum d.o.o.\n"
				 "All Rights Reserved v0.4" position:[Vector2 vectorWithX:4 y:462]];
	copyright.verticalAlign = VerticalAlignBottom;
	[scene addItem:copyright];
	*/
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
	
	GameState *newState = nil;
	
    NSMutableDictionary *levelDict = [[NSMutableDictionary alloc] init];
    
    if (planet.wasReleased) {
		newState = [[Gameplay alloc] initWithGame:self.game];
    } else if(buy.wasReleased) {
        // PARSE CODE - Example
        PFQuery *query = [PFQuery queryWithClassName:@"pointBase"];
        [query whereKey:@"id_devices" equalTo:@"lojsk123"];
        query.limit = 1000;
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                // The find succeeded.
                NSLog(@"Successfully retrieved %d scores.", objects.count);
                // Do something with the found objects
                for (PFObject *object in objects) {
                    if(![levelDict objectForKey:object[@"id_rocket"]]) {
                        [levelDict setObject:[[NSMutableArray alloc] initWithObjects:nil] forKey:object[@"id_rocket"]];
                    }
                    
                    float posY = [[NSString stringWithFormat:@"%@", object[@"pos_y"]] floatValue];
                    float posX = [[NSString stringWithFormat:@"%@", object[@"pos_x"]] floatValue];
                    float speed = [[NSString stringWithFormat:@"%@", object[@"speed"]] floatValue];
                    
                    StatePoints *point = [[StatePoints alloc] setX:posX Y:posY withTime:speed];
                    
                    [[levelDict objectForKey:object[@"id_rocket"]] addObject:point];
                    
                    
                }
            } else {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
            [Constants saveCustomLevel:levelDict];
        }];
    }
    
    
	if (newState) {
		[theRocket pushState:newState];
	}
}



@end
