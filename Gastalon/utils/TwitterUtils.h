//
//  TwitterUtils.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/14/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwitterUtils : NSObject

+(void)loginInController:(UIViewController*)controller;
+(UIImage*)retrieveProfileImage;
@end
