//
//  GSUIViewFormControl.m
//  Gastalon
//
//  Created by Mobile Developer on 12/27/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import "GSUIViewFormControl.h"

@implementation GSUIViewFormControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self design];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self design];
    }
    return self;
}

-(void)design{
    self.backgroundColor = [UIColor clearColor];
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    visualEffectView.frame = self.bounds;
    [self addSubview:visualEffectView];
}

@end
