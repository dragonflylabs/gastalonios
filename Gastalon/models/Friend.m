//
//  Friend.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "Friend.h"

@implementation Friend
-(id)initWithFullName:(NSString*)fullName andEmail:(NSString*)email andFriendType:(int)friendType andFacebookID:(NSString*)facebookID andTwitterID:(NSString*)twitterID andCachedPhoto:(NSData*)data andJoinedGastalon:(NSDate*)joinedGastalon{
    self = [super init];
    if(self){
        self.fullName = fullName;
        self.email = email;
        self.friendType = friendType;
        self.facebookID = facebookID;
        self.twitterID = twitterID;
        self.cachedPhoto = data;
        self.joinedGastalon = joinedGastalon;
    }
    return self;
}
@end
