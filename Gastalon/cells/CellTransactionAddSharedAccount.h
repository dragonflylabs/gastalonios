//
//  CellTransactionAddSharedAccount.h
//  Gastalon
//
//  Created by Yolanda Martínez on 14/03/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicCell.h"
#import "Account.h"

@interface CellTransactionAddSharedAccount : BasicCell
@property (nonatomic, strong)Account* sharedAccount;
@end
