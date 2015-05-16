//
//  Transaction.m
//  Gastalon
//
//  Created by Yolanda Martínez on 08/03/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "Transaction.h"

@implementation Transaction

-(id)initWithUserID:(NSString*)uuid andType:(int)type{
    self = [super init];
    if(self){
        self.uuid = [[NSUUID UUID] UUIDString];
        self.type = type;
        self.uuid = uuid;
        self.dateCreation = [NSDate new];
        self.dateModified = self.dateCreation;
    }
    return self;
}

+(NSString*)primaryKey{
    return @"uuid";
}
@end
