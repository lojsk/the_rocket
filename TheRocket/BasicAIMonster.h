//
//  BasicAIMonster.h
//  TheRocket
//
//  Created by OdpiralniCasi on 26/01/14.
//  Copyright (c) 2014 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Headers.TheRocket.classes.h"

@interface BasicAIMonster : StateMonster<ICustomUpdate, IAIModal> {
    AIMonsterModel *aiModal;
}

@end
