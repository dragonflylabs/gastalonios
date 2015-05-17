//
//  BaseModel.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "Transaction.h"
#import "ModelTypes.h"

@interface BaseModel : RLMObject
@property Transaction * transaction;
@property NSString * uuid;
-(id)initWithIdUser:(NSString*)uuid andType:(int)type;
@end

RLM_ARRAY_TYPE(BaseModel)
