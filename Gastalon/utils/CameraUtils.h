//
//  CameraUtils.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/3/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraUtils : NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>
-(id)initInViewController:(UIViewController*)viewController;
@end
