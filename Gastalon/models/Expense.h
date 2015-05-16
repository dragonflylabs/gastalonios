//
//  Expense.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/30/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "BaseModel.h"

@interface Expense : BaseModel
@property double amount;
@property BOOL periodically;
@property NSString * note;
@property NSMutableArray* images;
@property NSString * userID;
@property BOOL payed;
@property NSString* accountID;
@property NSString* categoryID;
-(id)initWithIdUser:(NSString*)uuid andType:(int)type andAmount:(double)amount isPeriodically:(BOOL)isPeriodically andNote:(NSString*)note isPayed:(BOOL)isPayed andAccountID:(NSString*)accountID andCategoryID:(NSString*)categoryID;
@end

RLM_ARRAY_TYPE(Expense)
