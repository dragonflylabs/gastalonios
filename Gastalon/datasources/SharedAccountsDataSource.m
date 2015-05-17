//
//  SharedAccountsDataSource.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "SharedAccountsDataSource.h"
#import "Account.h"

@implementation SharedAccountsDataSource
@synthesize sharedAccounts = _sharedAccounts;

-(void)setSharedAccounts:(RLMArray<Account> *)sharedAccounts{
    _sharedAccounts = sharedAccounts;
    countOfElements = (int)sharedAccounts.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sharedAccounts.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"CellSharedAccount";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 71.0;
}

@end
