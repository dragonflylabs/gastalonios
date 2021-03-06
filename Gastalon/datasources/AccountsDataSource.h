//
//  AccountsDataSource.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "Account.h"
#import "CustomDataSource.h"

@interface AccountsDataSource : CustomDataSource<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) RLMArray<Account>* accounts;

@end
