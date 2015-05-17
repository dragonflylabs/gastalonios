//
//  UserUtilities.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "UserUtilities.h"
#import "RealmFactory.h"

static User * user;

@implementation UserUtilities

+(User*)sharedInstance{
    if(!user){
        if ([User allObjects].count > 0) {
            user = [[User allObjects] objectAtIndex:0];
        }
    }
    return user;
}

+(void)eraseUser{
    if(!user){
        if ([User allObjects].count > 0) {
            user = [[User allObjects] objectAtIndex:0];
            RLMRealm * realm = [RLMRealm defaultRealm];
            [realm beginWriteTransaction];
            [realm deleteObject:user];
            [realm commitWriteTransaction];
        }
    }
}

+(NSString*)decodeUser{
    NSString * pretoken = [NSString stringWithFormat:@"%@:%@", user.email, user.token];
    NSData * data = [pretoken dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

+(void)insertOrUpdateUser:(User*)user{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [User createOrUpdateInRealm:realm withObject:user];
    [realm commitWriteTransaction];
}

@end
