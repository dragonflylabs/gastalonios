//
//  LoginViewController.h
//  Gastalon
//
//  Created by Mobile Developer on 12/26/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"

@interface LoginViewController : ViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIControl *btnFacebook;
- (IBAction)onFacebookLoginClick:(id)sender;
- (IBAction)onRegisterClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *edtEmail;
@property (weak, nonatomic) IBOutlet UITextField *edtPassword;

@end
