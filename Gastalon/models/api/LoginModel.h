//
//  LoginModel.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "BaseModelApi.h"
#import "User.h"

@interface LoginModel : BaseModelApi
@property(nonatomic, strong) NSString * token;
@property(nonatomic, assign) int confirmed;
@property(nonatomic, strong) User * user;

@end
