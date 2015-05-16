//
//  CameraUtils.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/3/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "CameraUtils.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "Tolo.h"
#import "EventsApi.h"

@interface CameraUtils ()
@property(nonatomic, strong) UIImage * image;
@property(nonatomic, strong) UIViewController * viewController;
@property BOOL newMedia;
@end

@implementation CameraUtils{
    UIActionSheet * sheet;
}

-(id)initInViewController:(UIViewController*)viewController{
    self = [super init];
    if(self){
        self.viewController = viewController;
        sheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"Image_Source", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", nil) destructiveButtonTitle:nil otherButtonTitles:NSLocalizedString(@"Camera_Source", nil), NSLocalizedString(@"Gallery_Source", nil), nil];
        [sheet showInView:viewController.view];
    }
    return self;
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex != [actionSheet cancelButtonIndex]){
        if([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:NSLocalizedString(@"Camera_Source", nil)]){
            if ([UIImagePickerController isSourceTypeAvailable:
                 UIImagePickerControllerSourceTypeCamera])
            {
                UIImagePickerController *imagePicker =
                [[UIImagePickerController alloc] init];
                imagePicker.delegate = self;
                imagePicker.sourceType =
                UIImagePickerControllerSourceTypeCamera;
                imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
                imagePicker.allowsEditing = NO;
                [self.viewController presentViewController:imagePicker
                                   animated:YES completion:nil];
                _newMedia = YES;
            }
        }else{
            if ([UIImagePickerController isSourceTypeAvailable:
                 UIImagePickerControllerSourceTypeSavedPhotosAlbum])
            {
                UIImagePickerController *imagePicker =
                [[UIImagePickerController alloc] init];
                imagePicker.delegate = self;
                imagePicker.sourceType =
                UIImagePickerControllerSourceTypePhotoLibrary;
                imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
                imagePicker.allowsEditing = NO;
                [self.viewController presentViewController:imagePicker
                                   animated:YES completion:nil];
                _newMedia = NO;
            }
        }
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    [picker dismissViewControllerAnimated:YES completion:nil];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        EventPhotoTaken * event = [EventPhotoTaken new];
        event.image = image;
        PUBLISH(event);
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,self, @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
}

-(void)image:(UIImage *)image finishedSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}
@end
