//
//  BaseModel.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

-(id)initWithIdUser:(NSString*)uuid andType:(int)type{
    self = [super init];
    if(self){
        self.transaction = [Transaction new];
        self.transaction.type = type;
        self.transaction.uuid = uuid;
        self.transaction.dateCreation = [NSDate new];
        self.transaction.dateModified = self.transaction.dateCreation;
        self.transaction.uuid = @"";
        self.uuid = [[NSUUID UUID] UUIDString];
    }
    return self;
}

+(NSString*)primaryKey{
    return @"uuid";
}
@end
