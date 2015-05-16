//
//  CellTransactionDidYouGetGroup.m
//  Gastalon
//
//  Created by Yolanda Martínez on 27/03/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "CellTransactionDidYouGetGroup.h"

@implementation CellTransactionDidYouGetGroup
@synthesize attributedLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)configureCell{
    [super configureCell];
    if(self.viewContent.subviews.count == 0){
        NSString *text = NSLocalizedString(@"TRANSACTION_DID_YOU_GET_GROUP", nil);
        Account * account = [RealmFactory accountForGuid:self.alarm.accountGuid];
        CategoryExpense * category = [RealmFactory categoryExpenseForID:self.alarm.income.categoryID];
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd-MM"];
        text = [NSString stringWithFormat:text, self.alarm.amount,self.alarm.income.note, account.name];
        attributedLabel = [self label:attributedLabel styleItems:[[NSArray alloc]initWithObjects:self.alarm.income.note,account.name, nil] inText:text];
        
        NSRange range = [attributedLabel.text rangeOfString:category.name];
        [attributedLabel addLinkToAddress:@{@"income" : self.alarm.income} withRange:range];
        [self.viewContent addSubview:attributedLabel];
        
        NSRange range2 = [attributedLabel.text rangeOfString:account.name];
        [attributedLabel addLinkToAddress:@{@"sharedAccount" : account} withRange:range2];
        [self.viewContent addSubview:attributedLabel];
    }
}

@end
