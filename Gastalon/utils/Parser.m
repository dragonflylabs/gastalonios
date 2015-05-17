//
//  Parser.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "Parser.h"
#import "BaseModelApi.h"
#import "LoginModel.h"
#import "Validators.h"
#import "FriendsList.h"
#import "Friend.h"

@implementation Parser

+(id)parseJSONWithResponse:(id)response andClass:(Class)clss{
    NSDictionary * json = response;
    int status = [json[@"status"] intValue];
    NSString * errors = json[@"errors"];
    NSString * message = json[@"message"];
    NSDictionary * data = json[@"data"];
    if(clss == [LoginModel class]){
        LoginModel * login = [[LoginModel alloc] initWithStatus:status andMessage:message andErrors:errors];
        login.token = [Validators notNull:data[@"token"]];
        login.confirmed = [data[@"confirmed"] intValue];
        User * user = [[User alloc] init];
        user.email = [Validators notNull:data[@"user"][@"username"]];
        user.twitterID = [Validators notNull:data[@"user"][@"twitterId"]];
        user.fullName = [Validators notNull:data[@"user"][@"fullName"]];
        user.facebookID = [Validators notNull:data[@"user"][@"facebookId"]];
        user.uuid = [Validators notNull:data[@"user"][@"uuid"]];
        login.user = user;
        return login;
    }else if(clss == [FriendsList class]){
        FriendsList * friendsList = [FriendsList new];
        friendsList.friends = [[NSMutableArray alloc] init];
        NSMutableArray * friends = data[@"friends"];
        for(NSDictionary * obj in friends){
            Friend * friend = [[Friend alloc] init];
            friend.fullName = obj[@"name"];
            friend.facebookID = obj[@"id"];
            friend.urlImage = obj[@"picture"][@"data"][@"url"];
            [friendsList.friends addObject:friend];
        }
        return response;
    }
    return nil;
}
@end
