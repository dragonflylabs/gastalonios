//
//  BaseModelApi.h
//  Gastalon
//
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModelApi : NSObject
@property(nonatomic, assign) int status;
@property(nonatomic, strong) NSString * message;
@property(nonatomic, strong) NSString * errors;
@property(nonatomic, strong) id data;
-(id)initWithStatus:(int)status andMessage:(NSString*)message andErrors:(NSString*)errors;
@end
