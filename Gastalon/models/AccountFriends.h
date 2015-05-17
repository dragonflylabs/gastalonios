//
//  AccountFriends.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "BaseModel.h"
#import "Friend.h"
#import "Account.h"

@interface AccountFriends : BaseModel
@property Friend * user;
@property Account * account;
@end

RLM_ARRAY_TYPE(AccountFriends)
