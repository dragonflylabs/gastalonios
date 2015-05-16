//
//  Transaction.h
//  Gastalon
//
//  Created by Yolanda Martínez on 08/03/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

@interface Transaction : RLMObject
@property int type;
@property NSDate * dateCreation;
@property NSDate * dateModified;
@property NSString * uuid;

-(id)initWithUserID:(NSString*)uuid andType:(int)type;
@end

RLM_ARRAY_TYPE(Transaction)
