//
//  UserUtilities.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface UserUtilities : NSObject
+(User*)sharedInstance;
+(void)eraseUser;
+(NSString*)decodeUser;
+(void)insertOrUpdateUser:(User*)user;
@end
