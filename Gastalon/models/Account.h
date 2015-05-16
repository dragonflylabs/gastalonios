//
//  Account.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/28/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "BaseModel.h"
#import "Expense.h"
#import "Friend.h"

@interface Account : BaseModel
@property NSString * name;
@property NSData * coverPhoto;
@property NSString* ownerID;
@property BOOL isShared;
@property double balance;
@property RLMArray<Expense> * expenses;
-(id)initWithIdUser:(NSString*)uuid andType:(int)type andName:(NSString*)name andCoverPhoto:(NSData*)data andOwnerID:(NSString*)ownerID isShared:(BOOL)isShared andBalance:(double)balance;
@end

RLM_ARRAY_TYPE(Account)
