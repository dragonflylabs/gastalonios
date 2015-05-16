//
//  User.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/5/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

@interface User : RLMObject

@property NSString * profileImage;
@property NSString * email;
@property NSString * token;
@property NSString * fullName;
@property NSString * facebookID;
@property NSString * twitterID;
@property NSString * uuid;
@property NSString * deviceToken;
@property NSString * deviceType;
@property NSString * imei;

@end
