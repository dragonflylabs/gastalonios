//
//  User.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "User.h"

@implementation User

-(id)init{
    self = [super init];
    if(self){
        self.email = @"";
        self.uuid = [[NSUUID UUID] UUIDString];
        self.fullName = @"";
        self.twitterID = @"";
        self.facebookID = @"";
        self.token = @"";
        self.deviceToken = @"";
        self.deviceType = [NSString stringWithFormat:@"%d", 2];
        self.imei = @"";
        self.profileImage = @"";
        self.facebookToken = @"";
    }
    return self;
}

+(NSString*)primaryKey{
    return @"uuid";
}

@end
