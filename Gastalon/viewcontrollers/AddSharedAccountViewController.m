//
//  AddSharedAccountViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/29/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "AddSharedAccountViewController.h"
#import "OperationTypes.h"

@interface AddSharedAccountViewController ()

@end

@implementation AddSharedAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onCancelClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onDoneClick:(id)sender {
    EventTransactionAdded * event = [EventTransactionAdded new];
    event.transaction = [BaseModel new];
    event.transaction.transaction = [Transaction new];
    event.transaction.transaction.type = TRANSACTION_ADD_SHARED_ACCOUNT;
    PUBLISH(event);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onAddFriendsClick:(id)sender {
    [self showModalControllerWithIdentifier:@"ADDFRIENDSCONTROLLER"];
}

-(UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}
@end
