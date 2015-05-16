//
//  AddAccountViewController.m
//  Gastalon
//
//  Created by Mobile Developer on 1/10/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "AddAccountViewController.h"
#import "OperationTypes.h"
#import "Validators.h"
#import "UITextField+Shake.h"
#import "CameraUtils.h"
#import "UIImage+Extras.h"
#import "UITextField+Extras.h"

@interface AddAccountViewController ()
@property (nonatomic, strong) CameraUtils * cameraUtils;
@end

@implementation AddAccountViewController



- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onCancelClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onDoneClick:(id)sender {
    if([self valid]){
        User * user = [UserUtilities sharedInstance];
        NSData * imageData = [[NSData alloc] init];
        if([[self.viewCover.subviews lastObject] isKindOfClass:[UIImageView class]]){
            UIImage * image = ((UIImageView*)[self.viewCover.subviews lastObject]).image;
            imageData = UIImagePNGRepresentation(image);
        }
        Account * account = [[Account alloc] initWithIdUser:user.uuid andType:TRANSACTION_ADD_ACCOUNT andName:[_edtAccountName cleanText] andCoverPhoto:imageData andOwnerID:user.uuid isShared:NO andBalance:[[_edtAmountBalance cleanText] doubleValue]];
        [RealmFactory insertOrUpdateAccount:account];
        PUBLISH([EventAddAccount new]);
        [self dismissViewControllerAnimated:YES completion:^(void){ PUBLISH([EventAddAccount new]); }];
    }
}

-(UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}

-(BOOL)valid{
    if(![Validators validAlphanumeric:_edtAccountName.text]){
        [_edtAccountName shake:5 withDelta:5];
        return NO;
    }
    if(![Validators validDecimal:_edtAmountBalance.text]){
        [_edtAmountBalance shake:5 withDelta:5];
        return NO;
    }
    return YES;
}
- (IBAction)onTakePhotoClick:(id)sender {
    self.cameraUtils = [[CameraUtils alloc] initInViewController:self];
}

SUBSCRIBE(EventPhotoTaken){
    if ([[self.viewCover.subviews lastObject] isKindOfClass:[UIImageView class]]) {
        [[[self.viewCover subviews] lastObject] removeFromSuperview];
    }
    event.image = [event.image imageByScalingAndCroppingForSize:CGSizeMake(1024, 768)];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:event.image];
    imageView.frame = self.viewCover.bounds;
    imageView.clipsToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.viewCover addSubview:imageView];
}
@end
