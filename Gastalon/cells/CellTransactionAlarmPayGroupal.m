//
//  CellTransactionAlarmPayGroupal.m
//  Gastalon
//
//  Created by Yolanda Martínez on 27/03/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "CellTransactionAlarmPayGroupal.h"
#import "RealmFactory.h"

@implementation CellTransactionAlarmPayGroupal
@synthesize attributedLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)configureCell{
    [super configureCell];
    if(self.viewContent.subviews.count == 0){
        NSString *text = NSLocalizedString(@"TRANSACTION_ALARM_PAY_GROUPAL", nil);
        Account * account = [RealmFactory accountForGuid:self.alarm.accountGuid];
        CategoryExpense * category = [RealmFactory categoryExpenseForID:self.alarm.expense.categoryID];
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd-MM"];
        text = [NSString stringWithFormat:text, self.alarm.amount,category.name,[formatter stringFromDate:self.alarm.dateTime], account.name];
        attributedLabel = [self label:attributedLabel styleItems:[[NSArray alloc]initWithObjects:category.name,account.name, nil] inText:text];
        
        NSRange range = [attributedLabel.text rangeOfString:category.name];
        [attributedLabel addLinkToAddress:@{@"category" : category} withRange:range];
        [self.viewContent addSubview:attributedLabel];
        
        NSRange range2 = [attributedLabel.text rangeOfString:account.name];
        [attributedLabel addLinkToAddress:@{@"sharedAccount" : account} withRange:range2];
        [self.viewContent addSubview:attributedLabel];
    }
}

@end
