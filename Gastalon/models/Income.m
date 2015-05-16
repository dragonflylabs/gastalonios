//
//  Income.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 4/7/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "Income.h"

@implementation Income

-(id)initWithIdUser:(NSString*)userID andType:(int)type andAmount:(double)amount isPeriodically:(BOOL)isPeriodically andNote:(NSString*)note isGained:(BOOL)isGained andAccountID:(NSString*)accountID andCategoryID:(NSString*)categoryID{
    self = [super initWithIdUser:userID andType:type];
    if(self){
        self.amount = amount;
        self.periodically = isPeriodically;
        self.note = note;
        self.gained = isGained;
        self.accountID = accountID;
        self.categoryID = categoryID;
    }
    return self;
}

+(NSArray*)ignoredProperties{
    return @[@"images"];
}

@end
