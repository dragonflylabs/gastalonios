//
//  Friend.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/28/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "BaseModel.h"

@interface Friend : RLMObject
@property NSString * fullName;
@property NSString * email;
@property int friendType;
@property NSString * facebookID;
@property NSString * twitterID;
@property NSData * cachedPhoto;
@property NSDate * joinedGastalon;

-(id)initWithFullName:(NSString*)fullName andEmail:(NSString*)email andFriendType:(int)friendType andFacebookID:(NSString*)facebookID andTwitterID:(NSString*)twitterID andCachedPhoto:(NSData*)data andJoinedGastalon:(NSDate*)joinedGastalon;
@end

RLM_ARRAY_TYPE(Friend)