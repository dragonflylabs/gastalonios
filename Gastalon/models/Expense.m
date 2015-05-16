//
//  Expense.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/30/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "Expense.h"

@implementation Expense

+(NSArray*)ignoredProperties{
    return @[@"images"];
}

-(id)initWithIdUser:(NSString*)uuid andType:(int)type andAmount:(double)amount isPeriodically:(BOOL)isPeriodically andNote:(NSString*)note isPayed:(BOOL)isPayed andAccountID:(NSString*)accountID andCategoryID:(NSString*)categoryID{
    self = [super initWithIdUser:uuid andType:type];
    if(self){
        self.amount = amount;
        self.periodically = isPeriodically;
        self.note = note;
        self.payed = isPayed;
        self.accountID = accountID;
        self.categoryID = categoryID;
    }
    return self;
}

@end
