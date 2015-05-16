//
//  BasicCell.m
//  Gastalon
//
//  Created by Yolanda Martínez on 27/03/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "BasicCell.h"

@implementation BasicCell

- (void)awakeFromNib {
    [self initView];
}

-(void)initView{
    CGFloat radius = self.indicator.frame.size.width / 2;
    self.indicator.layer.cornerRadius = radius;
    self.indicator.layer.masksToBounds = YES;
}

-(TTTAttributedLabel*)label:(TTTAttributedLabel*)label styleItems:(NSArray*)items inText:(NSString*)text{
    [label setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        for(NSString * item in items){
            NSRange boldRange = [[mutableAttributedString string] rangeOfString:item options:NSCaseInsensitiveSearch];
            CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)GASTALON_FONT_NAME_BOLD, 13, NULL);
            if (font) {
                [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)(font) range:boldRange];
                [mutableAttributedString addAttribute:(id)kCTForegroundColorAttributeName value:(id)GASTALON_COLOR range:boldRange];
                CFRelease(font);
            }
        }
        return mutableAttributedString;
    }];
    return label;
}

-(void)configureCell{
    self.attributedLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(0, 0, self.viewContent.frame.size.width, self.viewContent.frame.size.height)];
    self.attributedLabel.font = [UIFont fontWithName:GASTALON_FONT_NAME_LIGHT size:13];
    self.attributedLabel.textColor = [UIColor darkGrayColor];
    self.attributedLabel.linkAttributes = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:(__bridge NSString *)kCTUnderlineStyleAttributeName];
    [self.attributedLabel setLineBreakMode:NSLineBreakByWordWrapping];
    self.attributedLabel.numberOfLines = 0;
    
    NSMutableDictionary *mutableActiveLinkAttributes = [NSMutableDictionary dictionary];
    [mutableActiveLinkAttributes setValue:[NSNumber numberWithBool:NO] forKey:(NSString *)kCTUnderlineStyleAttributeName];
    [mutableActiveLinkAttributes setValue:[NSNumber numberWithFloat:5.0f] forKey:(NSString *)kTTTBackgroundCornerRadiusAttributeName];
    self.attributedLabel.activeLinkAttributes = mutableActiveLinkAttributes;
}
@end
