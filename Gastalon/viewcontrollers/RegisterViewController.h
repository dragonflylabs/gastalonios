//
//  RegisterViewController.h
//  Gastalon
//
//  Created by Mobile Developer on 12/31/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"
#import "FXBlurView.h"

@interface RegisterViewController : ViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIControl *btnFacebook;
- (IBAction)onFacebookLoginClick:(id)sender;
- (IBAction)onChooseProfilePictureClick:(id)sender;
- (IBAction)onCancelClick:(id)sender;
- (IBAction)onDoneClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *edtFullName;
@property (weak, nonatomic) IBOutlet UITextField *edtEmail;
@property (weak, nonatomic) IBOutlet UITextField *edtPassword;
@property (weak, nonatomic) IBOutlet UIControl *viewPhoto;
@end
