//
//  Parser.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/11/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "Parser.h"
#import "BaseModelApi.h"
#import "LoginModel.h"

@implementation Parser

+(id)parseJSONWithResponse:(id)response andClass:(Class)clss{
    NSDictionary * json = response;
    int status = [json[@"status"] intValue];
    NSString * errors = json[@"errors"];
    NSString * message = json[@"message"];
    NSDictionary * data = json[@"data"];
    if(clss == [LoginModel class]){
        LoginModel * login = [[LoginModel alloc] initWithStatus:status andMessage:message andErrors:errors];
        login.token = data[@"token"];
        login.confirmed = [data[@"confirmed"] intValue];
        return login;
    }
    return nil;
}
@end
