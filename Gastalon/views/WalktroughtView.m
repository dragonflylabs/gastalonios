//
//  WalktroughtView.m
//  Gastalon
//
//  Created by Yolanda Martínez on 14/03/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "WalktroughtView.h"
#import <SMPageControl/SMPageControl.h>
#import "Colors.h"
#import "Statics.h"
#import "DLStatics.h"

static NSString * const sampleDescription1 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
static NSString * const sampleDescription2 = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
static NSString * const sampleDescription3 = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
static NSString * const sampleDescription4 = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.";

@implementation WalktroughtView

-(id)initWithRootView:(UIView*)rootView{
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"This is page 2";
    page1.titleFont = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:18];
    page1.titlePositionY = 230;
    page1.desc = sampleDescription2;
    page1.descFont = [UIFont fontWithName:@"AppleSDGothicNeo-Light" size:17];
    page1.descPositionY = 210;
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IconGastalonWhite"]];
    page1.titleIconPositionY = 180;
    page1.showTitleView = NO;
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.titleFont = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:18];
    page2.titlePositionY = 230;
    page2.desc = sampleDescription2;
    page2.descFont = [UIFont fontWithName:@"AppleSDGothicNeo-Light" size:17];
    page2.descPositionY = 210;
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ImgWalktrought_1"]];
    page2.titleIconPositionY = 190;
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.titleFont = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:18];
    page3.titlePositionY = 230;
    page3.desc = sampleDescription2;
    page3.descFont = [UIFont fontWithName:@"AppleSDGothicNeo-Light" size:17];
    page3.descPositionY = 210;
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ImgWalktrought_2"]];
    page3.titleIconPositionY = 190;
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.titleFont = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:18];
    page4.titlePositionY = 230;
    page4.desc = sampleDescription2;
    page4.descFont = [UIFont fontWithName:@"AppleSDGothicNeo-Light" size:17];
    page4.descPositionY = 210;
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ImgWalktrought_3"]];
    page4.titleIconPositionY = 190;
    
    if(IS_IPHONE_4_OR_LESS){
        page1.titleIconPositionY -= 80;
        page2.titleIconPositionY -= 80;
        page3.titleIconPositionY -= 80;
        page4.titleIconPositionY -= 80;
        
        page1.descPositionY -= 30;
        page2.descPositionY -= 30;
        page3.descPositionY -= 30;
        page4.descPositionY -= 30;
        
        page1.titlePositionY -= 30;
        page2.titlePositionY -= 30;
        page3.titlePositionY -= 30;
        page4.titlePositionY -= 30;
    }
    
    if(IS_IPHONE_5){
        page1.titleIconPositionY -= 60;
        page2.titleIconPositionY -= 60;
        page3.titleIconPositionY -= 60;
        page4.titleIconPositionY -= 60;
        
        page1.descPositionY -= 30;
        page2.descPositionY -= 30;
        page3.descPositionY -= 30;
        page4.descPositionY -= 30;
        
        page1.titlePositionY -= 30;
        page2.titlePositionY -= 30;
        page3.titlePositionY -= 30;
        page4.titlePositionY -= 30;
    }
    
    self = [self initWithFrame:rootView.bounds andPages:@[page1,page2,page3,page4]];
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ImgLogoTypeface"]];
    self.titleView = titleView;
    self.titleViewY = 90;
    
    if(IS_IPHONE_4_OR_LESS){
        self.titleViewY -= 20;
    }
    
    if(IS_IPHONE_5){
        self.titleViewY -= 20;
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 45, 45)];
    [btn setTitle:@"" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn setImage:[UIImage imageNamed:@"IconArrowNext"] forState:UIControlStateNormal];
    self.skipButton = btn;
    self.skipButtonY = 60.f;
    self.skipButtonAlignment = EAViewAlignmentRight;
    self.tapToNext = YES;
    self.bgImage = [UIImage imageNamed:@"ImgBackgroundBlur"];
    self.pageControlY = 700;
    
    
    SMPageControl *pageControl = [[SMPageControl alloc] init];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = GASTALON_COLOR;
    [pageControl sizeToFit];
    self.pageControl = (UIPageControl *)pageControl;
    return self;
}

@end
