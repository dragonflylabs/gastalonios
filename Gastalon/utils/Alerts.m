//
//  Alerts.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "Alerts.h"
#import <MRProgress/MRProgressOverlayView.h>
#import <RKDropdownAlert/RKDropdownAlert.h>
#import "Colors.h"

static NSMutableDictionary * progressViews;

@implementation Alerts

+(void)showLoadingInView:(UIView*)view{
    MRProgressOverlayView *progressView = [MRProgressOverlayView new];
    progressView.titleLabelText = @"";
    [view addSubview:progressView];
    [progressView show:YES];
}

+(void)hideAllLoadingsForView:(UIView*)view{
    NSArray *loaders = [self allLoadersForview:view];
    for (MRProgressOverlayView *loader in loaders) {
        [loader hide:YES];
    }
}


+ (NSArray *)allLoadersForview:(UIView *)view {
    NSMutableArray *huds = [NSMutableArray array];
    NSArray *subviews = view.subviews;
    for (UIView *aView in subviews) {
        if ([aView isKindOfClass:[MRProgressOverlayView class]]) {
            [huds addObject:aView];
        }
    }
    return [NSArray arrayWithArray:huds];
}

+(void)showAlertMessage:(NSString*)message{
    [RKDropdownAlert title:message backgroundColor:GASTALON_COLOR_RED textColor:[UIColor whiteColor]];
}

+(void)showDefaultMessage:(NSString*)message{
    [RKDropdownAlert title:message backgroundColor:GASTALON_COLOR textColor:[UIColor whiteColor]];
}

+(void)showSuccessMessage:(NSString*)message{
    [RKDropdownAlert title:message backgroundColor:GASTALON_COLOR_GREEN textColor:[UIColor whiteColor]];
}

@end
