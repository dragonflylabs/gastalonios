//
//  AppDelegate.h
//  Gastalon
//
//  Created by Mobile Developer on 12/26/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UIWindow *_window;
    UINavigationController *_navigationController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navigationController;
-(void)logout;
@end

