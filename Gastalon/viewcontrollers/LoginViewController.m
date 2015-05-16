//
//  LoginViewController.m
//  Gastalon
//
//  Created by Mobile Developer on 12/26/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import "LoginViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "WalktroughtView.h"
#import <TwitterKit/TwitterKit.h>
#import "Statics.h"
#import "HtmlViewController.h"

@implementation LoginViewController{
    NSUserDefaults * defaults;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self design];
    defaults = [NSUserDefaults standardUserDefaults];
    BOOL walktroughtViewed = [defaults boolForKey:PREFS_WALKTROUGHT_VIEWED];
    if(!walktroughtViewed){
        WalktroughtView * walkView = [[WalktroughtView alloc] initWithRootView:self.navigationController.view];
        [walkView showInView:self.view animateDuration:0];
        [defaults setBool:YES forKey:PREFS_WALKTROUGHT_VIEWED];
        [defaults synchronize];
    }
}

-(void)design{

}

- (IBAction)onFacebookLoginClick:(id)sender {
    //TODO: Quit from here
    if(![UserUtilities sharedInstance]){
        User * user = [[User alloc] init];
        user.uuid = [[NSUUID UUID] UUIDString];
        user.token = @"TOKEN";
        user.deviceToken = @"";
        user.fullName = @"";
        user.facebookID = @"";
        user.twitterID = @"";
        user.deviceToken = @"";
        user.deviceType = @"";
        user.imei = @"";
        [RealmFactory insertOrUpdateUser:user];
    }
    [self showControllerWithIdentifier:@"MAINNAVIGATIONCONTROLLER"];
}

- (IBAction)onRegisterClick:(id)sender {
    [self showModalControllerWithIdentifier:@"REGISTERNAVIGATIONCONTROLLER"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"SEGUEFORGOTCONTROLLER"]) {
        [self.navigationController setNavigationBarHidden:NO];
        HtmlViewController * controller = (HtmlViewController*)[segue destinationViewController];
        controller.typeHtml = API_FORGOT_PASSWORD;
        controller.isShowingWebPage = YES;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    [self setNeedsStatusBarAppearanceUpdate];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

SUBSCRIBE(EventRegisteredUser){
    [self showControllerWithIdentifier:@"MAINNAVIGATIONCONTROLLER"];    
}
@end
