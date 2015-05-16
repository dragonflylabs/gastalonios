//
//  LoginModel.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/11/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "BaseModelApi.h"

@interface LoginModel : BaseModelApi
@property(nonatomic, strong) NSString * token;
@property(nonatomic, assign) int confirmed;
@end
