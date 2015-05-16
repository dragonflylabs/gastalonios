//
//  FacebookUtils.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/11/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "Tolo.h"
#import "EventsApi.h"

@interface FacebookUtils : NSObject

+(void)login;
+(UIImage*)retrieveProfileImage;
@end
