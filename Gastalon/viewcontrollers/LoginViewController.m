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
#import "Alerts.h"
#import "FacebookUtils.h"
#import "UITextField+Extras.h"
#import "DLEvents.h"
#import "LoginModel.h"
#import "AppDelegate.h"
#import "DLUtils.h"
#import "Validators.h"
#import <UITextField+Shake/UITextField+Shake.h>

@implementation LoginViewController{
    NSUserDefaults * defaults;
    User * user;
    BOOL isLoginFacebook;
}

#pragma mark Lifecycle

-(void)viewDidLoad{
    [super viewDidLoad];
    defaults = [NSUserDefaults standardUserDefaults];
    BOOL walktroughtViewed = [defaults boolForKey:PREFS_WALKTROUGHT_VIEWED];
    if(!walktroughtViewed){
        WalktroughtView * walkView = [[WalktroughtView alloc] initWithRootView:self.navigationController.view];
        [walkView showInView:self.view animateDuration:0];
        [defaults setBool:YES forKey:PREFS_WALKTROUGHT_VIEWED];
        [defaults synchronize];
    }
    isLoginFacebook = NO;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    [self setNeedsStatusBarAppearanceUpdate];
}

#pragma mark UI Events
- (IBAction)onFacebookLoginClick:(id)sender {
    if([DLUtils isConnected]){
        [Alerts showLoadingInView:self.view];
        isLoginFacebook = YES;
        [FacebookUtils login];
    }else{
        [Alerts showAlertMessage:NSLocalizedString(@"Error_Connection", nil)];
    }
}

- (IBAction)onRegisterClick:(id)sender {
    [self showModalControllerWithIdentifier:@"REGISTERNAVIGATIONCONTROLLER"];
}

#pragma mark Logic

- (void)onDoneClick:(id)sender {
    if([self valid]){
        if([DLUtils isConnected]){
            [Alerts showLoadingInView:self.view];
            [self doLogin];
        }else{
            [Alerts showAlertMessage:NSLocalizedString(@"Error_Connection", nil)];
        }
    }
}

-(void)doLogin{
    DLApi * api = [DLApi sharedApi];
    NSMutableDictionary * request = [[NSMutableDictionary alloc] init];
    [request setObject:user.email forKey:@"email"];
    [request setObject:user.facebookID forKey:@"facebookId"];
    if(!isLoginFacebook){
        [request setObject:[_edtPassword cleanText] forKey:@"password"];
    }else{
        [request setObject:@"" forKey:@"password"];
    }
    isLoginFacebook = NO;
    [api postObjectWithURLString:API_LOGIN
                       andObject:request];
}

#pragma mark Tolo

SUBSCRIBE(EventLoginFacebook){
    if(event.error){
        [Alerts hideAllLoadingsForView:self.view];
        [Alerts showAlertMessage:NSLocalizedString(@"Error_Facebook_Me_Request", nil)];
    }else{
        user = [[User alloc] init];
        user.facebookID = event.facebookID;
        user.fullName = event.name;
        user.email = event.email;
        user.facebookToken = event.facebookToken;
        [self doLogin];
    }
}

SUBSCRIBE(DLEventApi){
    [Alerts hideAllLoadingsForView:self.view];
    if(!event.error){
        LoginModel * login = [Parser parseJSONWithResponse:event.response andClass:[LoginModel class]];
        if([self validHTTPStatus:login.status]){
            if(login.status == HTTP_OK){
                login.user.token = login.token;
                [RealmFactory insertOrUpdateUser:login.user];
                [((AppDelegate*)[UIApplication sharedApplication].delegate) enter];
            }else if(login.status == GASTALON_USER_INACTIVE){
                [Alerts showSuccessMessage:NSLocalizedString(@"Confirm_Email", nil)];
            }else if(login.status == GASTALON_USER_NOT_EXISTS){
                [Alerts showSuccessMessage:NSLocalizedString(@"User_Not_Exists", nil)];
            }
        }
    }else{
        [Alerts showSuccessMessage:NSLocalizedString(@"Server_Error", nil)];        
    }
}

SUBSCRIBE(EventRegisteredUser){
    [((AppDelegate*)[UIApplication sharedApplication].delegate) enter];
}

#pragma mark Utilities
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"SEGUEFORGOTCONTROLLER"]) {
        [self.navigationController setNavigationBarHidden:NO];
        HtmlViewController * controller = (HtmlViewController*)[segue destinationViewController];
        controller.typeHtml = API_FORGOT_PASSWORD;
        controller.isShowingWebPage = YES;
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.edtEmail) {
        [self.edtPassword becomeFirstResponder];
    } else {
        [self.edtPassword resignFirstResponder];
        [self onDoneClick:self];
    }
    return YES;
}

#pragma mark Validations

-(BOOL)valid{
    if(![Validators validEmail:_edtEmail.text]){
        [_edtEmail shake];
        return NO;
    }
    if(![Validators validPassword:_edtPassword.text]){
        [_edtPassword shake];
        return NO;
    }
    user = [[User alloc] init];
    user.email = [_edtEmail cleanText];
    return YES;
}
@end
