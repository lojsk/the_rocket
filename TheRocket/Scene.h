//
//  Scene.h
//  FriHockey
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Headers.TheRocket.classes.h"

@interface Scene : NSObject <NSFastEnumeration> {
	NSMutableArray *items;
}

- (void) addItem:(id)item;

@end
