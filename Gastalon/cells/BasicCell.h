//
//  BasicCell.h
//  Gastalon
//
//  Created by Yolanda Martínez on 27/03/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTAttributedLabel.h"
#import "NSDate+TimeAgo.h"
#import "Statics.h"
#import "Colors.h"
#import "Transaction.h"
#import "RealmFactory.h"

@interface BasicCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *indicator;
@property (weak, nonatomic) IBOutlet UIView *viewContent;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (nonatomic, strong) TTTAttributedLabel *attributedLabel;
-(TTTAttributedLabel*)label:(TTTAttributedLabel*)label
                 styleItems:(NSArray*)items
                     inText:(NSString*)text;
-(void)configureCell;
@end
