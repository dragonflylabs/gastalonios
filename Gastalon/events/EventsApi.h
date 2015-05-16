//
//  EventsApi.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/29/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transaction.h"
#import <TTTAttributedLabel/TTTAttributedLabel.h>
#import "BaseModel.h"
#import "Account.h"

@interface EventTransactionAdded : NSObject
@property(nonatomic, strong) BaseModel * transaction;
@end

@interface EventAddAccount : NSObject
@end

@interface EventAddSharedAccount : NSObject
@end

@interface EventAccountClicked : NSObject
@property(nonatomic, strong) Account * account;
@end

@interface EventRegisteredUser : NSObject
@end

@interface EventLabelLink : NSObject
@property(nonatomic, strong) TTTAttributedLabel * label;
@property(nonatomic, strong) NSDictionary* addressComponents;
@end

@interface EventPhotoTaken : NSObject
@property(nonatomic, strong) UIImage* image;
@end

@interface EventLoginFacebook : NSObject
@property(nonatomic, strong) NSError * error;
@property(nonatomic, strong) NSString * name;
@property(nonatomic, strong) NSString * email;
@property(nonatomic, strong) NSString * urlImage;
@property(nonatomic, strong) NSString * facebookID;
@end

@interface EventLoginTwitter : NSObject
@property(nonatomic, strong) NSError * error;
@property(nonatomic, strong) NSString * name;
@property(nonatomic, strong) NSString * email;
@property(nonatomic, strong) NSString * urlImage;
@property(nonatomic, strong) NSString * twitterID;
@end

@interface EventFacebookPictureDownloaded : NSObject
@end

@interface EventTwitterPictureDownloaded : NSObject
@end

@interface EventTypedNumber : NSObject
@property (nonatomic, assign) BOOL isCleaning;
@property (nonatomic, strong) NSString * number;
@end