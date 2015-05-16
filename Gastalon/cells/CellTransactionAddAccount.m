//
//  CellTransactonAddAccount.m
//  Gastalon
//
//  Created by Yolanda Martínez on 08/03/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "CellTransactionAddAccount.h"
#import "TTTAttributedLabel.h"

@implementation CellTransactionAddAccount
@synthesize attributedLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)configureCell{
    [super configureCell];
    if(self.viewContent.subviews.count == 0){
        NSString *text = NSLocalizedString(@"TRANSACTION_ADD_ACCOUNT", nil);
        text = [NSString stringWithFormat:text, self.account.name, self.account.balance];
        attributedLabel = [self label:attributedLabel styleItems:[[NSArray alloc]initWithObjects:self.account.name, nil] inText:text];
        NSRange range = [attributedLabel.text rangeOfString:self.account.name];
        [attributedLabel addLinkToAddress:@{@"account" : self.account} withRange:range];
        [self.viewContent addSubview:attributedLabel];
    }
}

@end
