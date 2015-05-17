//
//  Account.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "Account.h"

@implementation Account
-(id)initWithIdUser:(NSString*)uuid andType:(int)type andName:(NSString*)name andCoverPhoto:(NSData*)data andOwnerID:(NSString*)ownerID isShared:(BOOL)isShared andBalance:(double)balance{
    self = [super initWithIdUser:uuid andType:type];
    if(self){
        self.name = name;
        self.coverPhoto = data;
        self.ownerID = ownerID;
        self.isShared = isShared;
        self.balance = balance;
    }
    return self;
}
@end
