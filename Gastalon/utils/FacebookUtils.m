//
//  FacebookUtils.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "FacebookUtils.h"
#import <SDWebImage/UIImageView+WebCache.h>

static UIImageView * profilePicture;

@implementation FacebookUtils

+(void)login{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    EventLoginFacebook * eventLogin = [EventLoginFacebook new];
    [login logInWithReadPermissions:@[@"email",@"public_profile", @"user_friends"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            if(error.code == 304){
                [self requestUserInformationWithEvent:eventLogin];
            }else{
                eventLogin.error = error;
                PUBLISH(eventLogin);
            }
        } else if (result.isCancelled) {
            eventLogin.error = [[NSError alloc] init];
            PUBLISH(eventLogin);
        } else {
            if ([result.grantedPermissions containsObject:@"email"]) {
                eventLogin.facebookToken = [result.token tokenString];
                [self requestUserInformationWithEvent:eventLogin];
            }else{
                eventLogin.error = [NSError new];
                PUBLISH(eventLogin);
            }
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
                PUBLISH([EventFacebookPictureDownloaded new]);
            }
        }];
    }
}

+(void)requestUserInformationWithEvent:(EventLoginFacebook*)eventLogin{
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{ @"fields" : @"id,name,email,picture.width(400).height(400)"}];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        NSLog(@"Result: %@", result);
        if(!error){
            eventLogin.facebookID = result[@"id"];
            eventLogin.email = result[@"email"];
            eventLogin.name = result[@"name"];
            eventLogin.urlImage = result[@"picture"][@"data"][@"url"];
            [self loadImageWithUrl:eventLogin.urlImage];
            PUBLISH(eventLogin);
        }else{
            eventLogin.error = error;
            PUBLISH(eventLogin);
        }
    }];
}

+(UIImage*)retrieveProfileImage{
    return profilePicture.image;
}

+(void)fetchTaggableFriedsWithToken:(NSString*)token{
    EventFacebookFriends * event = [EventFacebookFriends new];
    FBSDKGraphRequest * request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me/friends?limit=500"
                                      parameters:@{ @"fields" : @"id,name,picture.width(100).height(100)"
                                                    } tokenString:[[FBSDKAccessToken currentAccessToken] tokenString] version:@"v2.3" HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        if(error){
            event.error = error;
        }else{
            event.friends = result[@"data"];
        }
        PUBLISH(event);
    }];
}
@end
