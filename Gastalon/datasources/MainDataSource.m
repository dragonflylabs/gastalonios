//
//  MainDataSource.m
//  Gastalon
//
//  Created by Yolanda Martínez on 08/03/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "MainDataSource.h"
#import "CellTransactionAddAccount.h"
#import "CellTransactionAddSharedAccount.h"
#import "CellTransactionAlarmPay.h"
#import "CellTransactionAlarmPayGroupal.h"
#import "CellTransactionDidYouGetGroup.h"
#import "CellTransactionDidYouGetTheMoney.h"
#import "CellTransactionFriendAddedYouToAccount.h"
#import "CellTransactionFriendGainMoney.h"
#import "CellTransactionFriendSpentMoney.h"
#import "CellTransactionYouAddedFriendsToAccount.h"
#import "CellTransactionYouAddedFriendToAccount.h"
#import "CellTransactionYouHasGainedInShared.h"
#import "CellTransactionYouHasGainedMoney.h"
#import "CellTransactionYouHasSpent.h"
#import "OperationTypes.h"
#import "Tolo.h"
#import "EventsApi.h"
#define kTableViewCellHeight 100.0

@implementation MainDataSource
@synthesize transactions = _transactions;

-(void)setTransactions:(NSMutableArray *)transactions{
    _transactions = transactions;
    countOfElements = (int)transactions.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.transactions.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseModel * model = (BaseModel*)self.transactions[indexPath.row];
    switch (model.transaction.type) {
        case TRANSACTION_ADD_ACCOUNT:{
            static NSString * identifier = @"CELL_TRANSACTION_ADD_ACCOUNT";
            CellTransactionAddAccount* cell = (CellTransactionAddAccount*)[tableView dequeueReusableCellWithIdentifier:identifier];
            Account* account = (Account*)self.transactions[indexPath.row];
            cell.account = account;
            cell.attributedLabel.delegate = self;
            cell.attributedLabel.userInteractionEnabled = YES;
            cell.lblDate.text = [account.transaction.dateCreation timeAgo];
            [cell configureCell];
            return cell;
        }
        case TRANSACTION_ADD_SHARED_ACCOUNT:{
            static NSString * identifier = @"CELL_TRANSACTION_ADD_SHARED_ACCOUNT";
            CellTransactionAddSharedAccount* cell = (CellTransactionAddSharedAccount*)[tableView dequeueReusableCellWithIdentifier:identifier];
            Account* account = (Account*)self.transactions[indexPath.row];
            cell.sharedAccount = account;
            cell.attributedLabel.delegate = self;
            cell.attributedLabel.userInteractionEnabled = YES;
            cell.lblDate.text = [account.transaction.dateCreation timeAgo];
            [cell configureCell];
            return cell;
        }
        case TRANSACTION_ALARM_PAY:{
            static NSString * identifier = @"CELL_TRANSACTION_ALARM_PAY";
            CellTransactionAlarmPay * cell = (CellTransactionAlarmPay*)[tableView dequeueReusableCellWithIdentifier:identifier];
            AlarmLocalExpense * alarm = (AlarmLocalExpense*)self.transactions[indexPath.row];
            cell.alarm = alarm;
            cell.attributedLabel.delegate = self;
            cell.attributedLabel.userInteractionEnabled = YES;
            [cell.lblDate setAlpha:0];
            [cell configureCell];
            return cell;
        }
        case TRANSACTION_ALARM_PAY_GROUPAL:{
            static NSString * identifier = @"CELL_TRANSACTION_ALARM_PAY_GROUPAL";
            CellTransactionAlarmPayGroupal * cell = (CellTransactionAlarmPayGroupal*)[tableView dequeueReusableCellWithIdentifier:identifier];
            AlarmServerExpense * alarm = (AlarmServerExpense*)self.transactions[indexPath.row];
            cell.alarm = alarm;
            cell.attributedLabel.delegate = self;
            cell.attributedLabel.userInteractionEnabled = YES;
            [cell.lblDate setAlpha:0];
            [cell configureCell];
            return cell;
        }
        case TRANSACTION_DID_YOU_GET_GROUP:{
            static NSString * identifier = @"CELL_TRANSACTION_DID_YOU_GET_GROUP";
            CellTransactionDidYouGetGroup * cell = (CellTransactionDidYouGetGroup*)[tableView dequeueReusableCellWithIdentifier:identifier];
            AlarmServerIncome * alarm = (AlarmServerIncome*)self.transactions[indexPath.row];
            cell.alarm = alarm;
            cell.attributedLabel.delegate = self;
            cell.attributedLabel.userInteractionEnabled = YES;
            [cell.lblDate setAlpha:0];
            [cell configureCell];
            return cell;
        }
        case TRANSACTION_DID_YOU_GET_THE_MONEY:{
            static NSString * identifier = @"CELL_TRANSACTION_DID_YOU_GET_THE_MONEY";
            CellTransactionDidYouGetTheMoney * cell = (CellTransactionDidYouGetTheMoney*)[tableView dequeueReusableCellWithIdentifier:identifier];
            AlarmLocalIncome * alarm = (AlarmLocalIncome*)self.transactions[indexPath.row];
            cell.alarm = alarm;
            cell.attributedLabel.delegate = self;
            cell.attributedLabel.userInteractionEnabled = YES;
            [cell.lblDate setAlpha:0];
            [cell configureCell];
            return cell;
        }
        case TRANSACTION_FRIEND_ADDED_YOU_TO_ACCOUNT:{
            static NSString * identifier = @"CELL_TRANSACTION_FRIEND_ADDED_YOU_TO_ACCOUNT";
            CellTransactionFriendAddedYouToAccount * cell = (CellTransactionFriendAddedYouToAccount*)[tableView dequeueReusableCellWithIdentifier:identifier];
            cell.attributedLabel.delegate = self;
            cell.attributedLabel.userInteractionEnabled = YES;
            return cell;
        }
        case TRANSACTION_FRIEND_GAIN_MONEY:{
            static NSString * identifier = @"CELL_TRANSACTION_FRIEND_GAIN_MONEY";
            CellTransactionFriendGainMoney * cell = (CellTransactionFriendGainMoney*)[tableView dequeueReusableCellWithIdentifier:identifier];
            cell.attributedLabel.delegate = self;
            cell.attributedLabel.userInteractionEnabled = YES;
            return cell;
        }
        case TRANSACTION_FRIEND_SPENT_MONEY:{
            static NSString * identifier = @"CELL_TRANSACTION_FRIEND_SPENT_MONEY";
            CellTransactionFriendSpentMoney * cell = (CellTransactionFriendSpentMoney*)[tableView dequeueReusableCellWithIdentifier:identifier];
            cell.attributedLabel.delegate = self;
            cell.attributedLabel.userInteractionEnabled = YES;
            return cell;
        }
        case TRANSACTION_YOU_ADDED_FRIEND_TO_ACCOUNT:{
            static NSString * identifier = @"CELL_TRANSACTION_YOU_ADDED_FRIEND_TO_ACCOUNT";
            CellTransactionYouAddedFriendsToAccount * cell = (CellTransactionYouAddedFriendsToAccount*)[tableView dequeueReusableCellWithIdentifier:identifier];
            cell.attributedLabel.delegate = self;
            cell.attributedLabel.userInteractionEnabled = YES;
            return cell;
        }
        case TRANSACTION_YOU_ADDED_FRIENDS_TO_ACCOUNT:{
            static NSString * identifier = @"CELL_TRANSACTION_YOU_ADDED_FRIENDS_TO_ACCOUNT";
            CellTransactionYouAddedFriendsToAccount * cell = (CellTransactionYouAddedFriendsToAccount*)[tableView dequeueReusableCellWithIdentifier:identifier];
            cell.attributedLabel.delegate = self;
            cell.attributedLabel.userInteractionEnabled = YES;
            return cell;
        }
        case TRANSACTION_YOU_HAS_GAINED_IN_SHARED:{
            static NSString * identifier = @"CELL_TRANSACTION_YOU_HAS_GAINED_IN_SHARED";
            CellTransactionYouHasGainedInShared * cell = (CellTransactionYouHasGainedInShared*)[tableView dequeueReusableCellWithIdentifier:identifier];
            cell.attributedLabel.delegate = self;
            cell.attributedLabel.userInteractionEnabled = YES;
            return cell;
        }
        case TRANSACTION_YOU_HAS_GAINED_MONEY:{
            static NSString * identifier = @"CELL_TRANSACTION_YOU_HAS_GAINED_MONEY";
            CellTransactionYouHasGainedMoney * cell = (CellTransactionYouHasGainedMoney*)[tableView dequeueReusableCellWithIdentifier:identifier];
            cell.attributedLabel.delegate = self;
            cell.attributedLabel.userInteractionEnabled = YES;
            return cell;
        }
        case TRANSACTION_YOU_HAS_SPENT:{
            static NSString * identifier = @"CELL_TRANSACTION_YOU_HAS_SPENT";
            CellTransactionYouHasSpent * cell = (CellTransactionYouHasSpent*)[tableView dequeueReusableCellWithIdentifier:identifier];
            cell.attributedLabel.delegate = self;
            cell.attributedLabel.userInteractionEnabled = YES;
            return cell;
        }
        default:
            return [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    }
    return [tableView dequeueReusableCellWithIdentifier:@"Cell"];
}

-(void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithAddress:(NSDictionary *)addressComponents{
    NSLog(@"User tapped on link: \t%@", addressComponents);
    EventLabelLink * event = [EventLabelLink new];
    event.label = label;
    event.addressComponents = addressComponents;
    PUBLISH(event);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kTableViewCellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

@end
