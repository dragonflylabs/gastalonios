//
//  AddSharedAccountViewController.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"

@interface AddSharedAccountViewController : ViewController
@property (weak, nonatomic) IBOutlet UITextField *edtAccountName;
@property (weak, nonatomic) IBOutlet UITextField *edtAccountBalance;

- (IBAction)onAddFriendsClick:(id)sender;

@end
