    //
//  ViewController.m
//  Gastalon
//
//  Created by Mobile Developer on 12/26/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"
#import "Alerts.h"
#import "AppDelegate.h"
#import <AFNetworking/AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView;

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ImgLogoTypeface.png"]];
    REGISTER();
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)showControllerWithIdentifier:(NSString*)identifier{
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:identifier] animated:YES];
}

-(void)showControllerHiddingBottomBar:(NSString*)identifier{
    UIViewController * controller = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)showModalControllerWithIdentifier:(NSString*)identifier{
    [self.navigationController presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:identifier] animated:YES completion:nil];
}

-(UIView*)loadViewWithName:(NSString*)name{
    return [[[NSBundle mainBundle] loadNibNamed:name owner:self options:nil] objectAtIndex:0];
}


#pragma Keyboard Notifications

#define kOFFSET_FOR_KEYBOARD 130.0

-(void) unregisterForKeyboardNotificatons{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

-(void) registerForKeyboardNotifications{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}


- (void)keyboardWillBeShown:(NSNotification*)aNotification{
    
    if (self.view.frame.origin.y >= 0) {
        [self setViewMovedUp:YES];
    } else if (self.view.frame.origin.y < 0) {
        [self setViewMovedUp:NO];
    }
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification{
    if (self.view.frame.origin.y >= 0) {
        [self setViewMovedUp:YES];
    } else if (self.view.frame.origin.y < 0) {
        [self setViewMovedUp:NO];
    }
}

- (void) setViewMovedUp:(BOOL) movedUp {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = self.view.frame;
    if (movedUp){
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    } else {
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

-(BOOL)validHTTPStatus:(int)status{
    switch (status) {
        case HTTP_ACCESS_DENIED:
            [Alerts showAlertMessage:NSLocalizedString(@"Error_Credentials", nil)];
            return NO;
        case HTTP_BAD_REQUEST:
            [Alerts showAlertMessage:NSLocalizedString(@"Error_Request", nil)];
            return NO;
        case HTTP_NOT_FOUND:
            [Alerts showAlertMessage:NSLocalizedString(@"Error_404", nil)];
            return NO;
        case HTTP_TOKEN_INVALID:
            [[[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"Session_Expired", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"Accept", nil) otherButtonTitles:nil, nil] show];
            [((AppDelegate*)([UIApplication sharedApplication].delegate)) logout];
            return NO;
        default:
            return YES;
    }
}
@end
