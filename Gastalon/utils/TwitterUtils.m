//
//  TwitterUtils.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "TwitterUtils.h"
#import <TwitterKit/TwitterKit.h>
#import "EventsApi.h"
#import "Tolo.h"
#import <SDWebImage/UIImageView+WebCache.h>

static UIImageView * profilePicture;

@implementation TwitterUtils

+(void)loginInController:(UIViewController*)controller{
    EventLoginTwitter * eventLogin = [EventLoginTwitter new];
    [[Twitter sharedInstance] logInWithCompletion:^(TWTRSession *session, NSError *error) {
         if (session) {
             eventLogin.twitterID = [session userID];
             if ([[Twitter sharedInstance] session]) {
                 TWTRShareEmailViewController* shareEmailViewController = [[TWTRShareEmailViewController alloc] initWithCompletion:^(NSString* email, NSError* error) {
                      if(error){
                          eventLogin.error = error;
                          PUBLISH(eventLogin);
                      }else{
                          eventLogin.email = email;
                          [[[Twitter sharedInstance] APIClient] loadUserWithID:eventLogin.twitterID completion:^(TWTRUser *user, NSError *error) {
                              eventLogin.urlImage = user.profileImageURL;
                              eventLogin.name = user.name;
                              [self loadImageWithUrl:eventLogin.urlImage];
                              PUBLISH(eventLogin);
                          }];
                      }
                  }];
                 [controller presentViewController:shareEmailViewController animated:YES completion:nil];
             } else {
                 eventLogin.error = [NSError new];
                 PUBLISH(eventLogin);
             }
         } else {
             eventLogin.error = error;
             PUBLISH(eventLogin);
         }
     }];
}

+(void)loadImageWithUrl:(NSString*)url{
    if(url){
        if(!profilePicture){
            profilePicture = [[UIImageView alloc] init];
        }
        [profilePicture sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if(!error){
                PUBLISH([EventTwitterPictureDownloaded new]);
            }
        }];
    }
}

+(UIImage*)retrieveProfileImage{
    return profilePicture.image;
}
@end
