//
//  AddFriendsViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/28/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "AddFriendsViewController.h"
#import "FriendsDataSource.h"
#import "Friend.h"
#import "OperationTypes.h"

@interface AddFriendsViewController ()

@end

@implementation AddFriendsViewController{
    NSMutableArray * friends;
    FriendsDataSource * friendsDataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self designView];
    friendsDataSource = [[FriendsDataSource alloc] init];
    friends = [[NSMutableArray alloc] init];
    for(int i = 0; i < 10; i++){
        Friend * friend = [[Friend alloc] init];
        [friends addObject:friend];
    }
    [friendsDataSource setFriends:friends];
    self.friendsTableView.dataSource = friendsDataSource;
    [self.friendsTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onDoneClick:(id)sender {
    EventTransactionAdded * event = [EventTransactionAdded new];
    event.transaction = [BaseModel new];
    event.transaction.transaction = [Transaction new];
    event.transaction.transaction.type = TRANSACTION_YOU_ADDED_FRIENDS_TO_ACCOUNT;
    PUBLISH(event);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onCancelClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)designView{
    float radius = ((UIControl*)[self.socialButtons objectAtIndex:0]).frame.size.width / 2;
    for(UIControl* control in self.socialButtons){
        control.layer.cornerRadius = radius;
    }
}

-(UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}
@end
