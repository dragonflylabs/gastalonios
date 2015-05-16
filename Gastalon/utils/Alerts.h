//
//  Alerts.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/11/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Alerts : NSObject
+(void)showLoadingInView:(UIView*)view;
+(void)hideAllLoadingsForView:(UIView*)view;
+(void)showAlertMessage:(NSString*)message;
+(void)showDefaultMessage:(NSString*)message;
+(void)showSuccessMessage:(NSString*)message;
@end
