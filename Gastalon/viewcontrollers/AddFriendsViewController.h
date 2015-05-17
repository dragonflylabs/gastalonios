//
//  AddFriendsViewController.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"

@interface AddFriendsViewController : ViewController
@property (weak, nonatomic) IBOutlet UITableView *friendsTableView;
- (IBAction)onDoneClick:(id)sender;
- (IBAction)onCancelClick:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UIControl) NSArray *socialButtons;

@end
