//
//  MainDataSource.h
//  Gastalon
//
//  Created by Yolanda Martínez on 08/03/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import <TTTAttributedLabel/TTTAttributedLabel.h>
#import "BaseModel.h"
#import "CustomDataSource.h"

@interface MainDataSource : CustomDataSource<UITableViewDataSource, TTTAttributedLabelDelegate, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray * transactions;
@end
