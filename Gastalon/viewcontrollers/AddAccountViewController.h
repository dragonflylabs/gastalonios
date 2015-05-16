//
//  AddAccountViewController.h
//  Gastalon
//
//  Created by Mobile Developer on 1/10/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"

@interface AddAccountViewController : ViewController
- (IBAction)onCancelClick:(id)sender;
- (IBAction)onDoneClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewCover;
@property (weak, nonatomic) IBOutlet UITextField *edtAccountName;
@property (weak, nonatomic) IBOutlet UITextField *edtAmountBalance;
- (IBAction)onTakePhotoClick:(id)sender;

@end
