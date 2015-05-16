//
//  CellAccount.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/5/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellAccount : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblAccountName;
@property (weak, nonatomic) IBOutlet UILabel *lblAccountIncomes;
@property (weak, nonatomic) IBOutlet UILabel *lblAccountExpenses;
@property (weak, nonatomic) IBOutlet UILabel *lblAccountBalance;

@end
