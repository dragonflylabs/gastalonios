//
//  UIImageView+Extras.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/5/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(Extras)
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
- (NSString*)base64encodedImage;
@end