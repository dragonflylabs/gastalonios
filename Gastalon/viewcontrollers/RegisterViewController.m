//
//  RegisterViewController.m
//  Gastalon
//
//  Created by Mobile Developer on 12/31/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import "RegisterViewController.h"
#import "HtmlViewController.h"
#import "Validators.h"
#import "UITextField+Shake.h"
#import "CameraUtils.h"
#import "UIImage+Extras.h"
#import "DLUtils.h"
#import "DLEvents.h"
#import "UITextField+Extras.h"
#import "LoginModel.h"
#import "Alerts.h"
#import "FacebookUtils.h"
#import "TwitterUtils.h"
#import "FXBlurView.h"

@interface RegisterViewController ()
@property(nonatomic, strong) CameraUtils * cameraUtils;
@end
@implementation RegisterViewController{
    BOOL isPhotoTaken;
    User * user;
}

#pragma mark LifeCycle

-(void)viewDidLoad{
    [super viewDidLoad];
    [self design];
    isPhotoTaken = NO;
    user = [[User alloc] init];
}

#pragma mark UI Events
- (IBAction)onCancelClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onDoneClick:(id)sender {
    if([self valid]){
        if([DLUtils isConnected]){
            [self login];
        }else{
            [Alerts showAlertMessage:NSLocalizedString(@"Error_Connection", nil)];
        }
    }
}

- (IBAction)onFacebookLoginClick:(id)sender {
    if([DLUtils isConnected]){
        [Alerts showLoadingInView:self.view];
        [FacebookUtils login];
    }else{
        [Alerts showAlertMessage:NSLocalizedString(@"Error_Connection", nil)];   
    }
}

- (IBAction)onChooseProfilePictureClick:(id)sender {
    self.cameraUtils = [[CameraUtils alloc] initInViewController:self];
}

#pragma mark Logic

-(void)login{
    DLApi * api = [DLApi sharedApi];
    [Alerts showLoadingInView:self.view];
    NSMutableDictionary * request = [[NSMutableDictionary alloc] init];
    [request setObject:user.fullName forKey:@"fullName"];
    [request setObject:user.email forKey:@"email"];
    [request setObject:user.facebookID forKey:@"facebookId"];
    [request setObject:user.twitterID forKey:@"twitterId"];
    if(![[_edtPassword cleanText] isEqualToString:@""]){
        [request setObject:user.fullName forKey:@"fullName"];
    }
    [api postObjectWithURLString:API_REGISTER
                       andObject:request];
}

-(void)updatePhotoWithImage:(UIImage*)image{
    if ([[self.viewPhoto.subviews lastObject] isKindOfClass:[UIImageView class]]) {
        [[[self.viewPhoto subviews] lastObject] removeFromSuperview];
    }
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = self.viewPhoto.bounds;
    imageView.clipsToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.layer.cornerRadius = imageView.frame.size.width / 2;
    [self.viewPhoto addSubview:imageView];
    [self encodedImage];
}

#pragma mark Tolo

SUBSCRIBE(EventPhotoTaken){
    event.image = [event.image imageByScalingAndCroppingForSize:CGSizeMake(400, 400)];
    [self updatePhotoWithImage:event.image];
}

SUBSCRIBE(EventLoginFacebook){
    [Alerts hideAllLoadingsForView:self.view];
    if(event.error){
        [Alerts showAlertMessage:NSLocalizedString(@"Error_Facebook_Me_Request", nil)];
    }else{
        user.facebookID = event.facebookID;
        _edtFullName.text = event.name;
        _edtEmail.text = event.email;
        user.fullName = [_edtFullName cleanText];
        user.email = [_edtEmail cleanText];
        [self login];
    }
}


SUBSCRIBE(EventFacebookPictureDownloaded){
    UIImage * image = [[FacebookUtils retrieveProfileImage] imageByScalingAndCroppingForSize:CGSizeMake(400, 400)];
    [self updatePhotoWithImage:image];
}

SUBSCRIBE(DLEventApi){
    [Alerts hideAllLoadingsForView:self.view];
    if([self validHTTPStatus:event.error]){
        LoginModel * login = [Parser parseJSONWithResponse:event.response andClass:[LoginModel class]];
        if(login.status == GASTALON_USER_INACTIVE){
            user.token = login.token;
            [RealmFactory insertOrUpdateUser:user];
            [self dismissViewControllerAnimated:YES completion:^{
                [Alerts showSuccessMessage:NSLocalizedString(@"Confirm_Email", nil)];
            }];
        }else if(login.status == GASTALON_USER_EXISTS){
            [Alerts showAlertMessage:NSLocalizedString(@"User_Exists", nil)];
        }else if(login.status == GASTALON_USER_ACTIVE){
            user.token = login.token;
            [RealmFactory insertOrUpdateUser:user];
            [self dismissViewControllerAnimated:YES completion:^{
                [Alerts showSuccessMessage:@"Login"];
            }];
        }
    }
}

#pragma mark Utilities
-(UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}


-(void)design{
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"SEGUETERMSCONTROLLER"]) {
        HtmlViewController * controller = (HtmlViewController*)[segue destinationViewController];
        controller.typeHtml = @"conditions";
    }
}

-(void)encodedImage{
    if ([[self.viewPhoto.subviews lastObject] isKindOfClass:[UIImageView class]]) {
        UIImageView * imageview = [[self.viewPhoto subviews] lastObject];
        if(imageview.image != nil){
            user.profileImage = [imageview.image base64encodedImage];
            return;
        }
    }
    user.profileImage =  @"";
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.edtFullName) {
        [self.edtEmail becomeFirstResponder];
    } else if (textField == self.edtEmail) {
        [self.edtPassword becomeFirstResponder];
    } else {
        [self.edtPassword resignFirstResponder];
        [self onDoneClick:nil];
    }
    return YES;
}

#pragma mark Validations

-(BOOL)valid{
    if(![Validators validName:_edtFullName.text]){
        [_edtFullName shake];
        return NO;
    }
    if(![Validators validEmail:_edtEmail.text]){
        [_edtEmail shake];
        return NO;
    }
    if(![Validators validPassword:_edtPassword.text]){
        [_edtPassword shake];
        return NO;
    }
    user.fullName = [_edtFullName cleanText];
    user.email = [_edtEmail cleanText];
    return YES;
}
@end
