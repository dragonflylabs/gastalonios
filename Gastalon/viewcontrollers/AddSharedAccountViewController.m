//
//  AddSharedAccountViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "AddSharedAccountViewController.h"
#import "OperationTypes.h"
#import "UITextField+Extras.h"

@interface AddSharedAccountViewController ()

@end

@implementation AddSharedAccountViewController{
    User * user;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    user = [UserUtilities sharedInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onCancelClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onDoneClick:(id)sender {
    Account * account = [[Account alloc] initWithIdUser:user.uuid andType:TRANSACTION_ADD_SHARED_ACCOUNT];
    account.name = [_edtAccountName cleanText];
    account.balance = [[_edtAccountBalance cleanText] floatValue];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}
- (IBAction)onAddFriendsClick:(id)sender {
        [self showControllerWithIdentifier:@"ADDFRIENDSCONTROLLER"];
}
@end
