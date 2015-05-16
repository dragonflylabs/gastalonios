//
//  CellTransactionAddSharedAccount.m
//  Gastalon
//
//  Created by Yolanda Martínez on 14/03/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "CellTransactionAddSharedAccount.h"

@implementation CellTransactionAddSharedAccount
@synthesize attributedLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)configureCell{
    [super configureCell];
    if(self.viewContent.subviews.count == 0){
        NSString *text = NSLocalizedString(@"TRANSACTION_ADD_SHARED_ACCOUNT", nil);
        text = [NSString stringWithFormat:text, self.sharedAccount.name, self.sharedAccount.balance];
        attributedLabel = [self label:attributedLabel styleItems:[[NSArray alloc]initWithObjects:self.sharedAccount.name, nil] inText:text];
        NSRange range = [attributedLabel.text rangeOfString:self.sharedAccount.name];
        [attributedLabel addLinkToAddress:@{@"sharedAccount" : self.sharedAccount} withRange:range];
        [self.viewContent addSubview:attributedLabel];
    }
}

@end
