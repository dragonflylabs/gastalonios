//
//  GSUIImageViewBackground.m
//  Gastalon
//
//  Created by Mobile Developer on 12/26/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import "GSUIImageViewBackground.h"

@implementation GSUIImageViewBackground

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customImage];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customImage];
    }
    return self;
}

-(void)customImage{
    self.image = [UIImage imageNamed:@"ImgBackground.png"];
    self.contentMode = UIViewContentModeScaleAspectFill;
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    visualEffectView.frame = [UIScreen mainScreen].applicationFrame;
    [self addSubview:visualEffectView];
}
@end
