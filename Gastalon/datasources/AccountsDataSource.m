//
//  AccountsDataSource.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/28/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "AccountsDataSource.h"
#import "CellAccount.h"
#import "Validators.h"

@implementation AccountsDataSource

-(void)loadItems{
    self.accounts = [RealmFactory getAccountWithOffset:0 andCount:10];
    countOfElements = (int)_accounts.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"CellAccount";
    CellAccount * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    Account * account = [self.accounts objectAtIndex:indexPath.row];
    cell.lblAccountName.text = account.name;
    cell.lblAccountBalance.text = [Validators numberCurrencyFormatter:account.balance];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.accounts.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EventAccountClicked * event = [EventAccountClicked new];
    event.account = [self.accounts objectAtIndex:indexPath.row];
    PUBLISH(event);
}
@end
