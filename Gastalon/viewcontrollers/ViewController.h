//
//  ViewController.h
//  Gastalon
//
//  Created by Mobile Developer on 12/26/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tolo.h"
#import "EventsApi.h"
#import "RealmFactory.h"
#import "Urls.h"
#import "UserUtilities.h"
#import "DLApi.h"
#import "Parser.h"

#define HTTP_BAD_REQUEST 400
#define HTTP_NOT_FOUND 404
#define HTTP_ACCESS_DENIED 401
#define HTTP_TOKEN_INVALID 403
#define HTTP_OK 200

#define GASTALON_USER_INACTIVE 701
#define GASTALON_USER_NOT_EXISTS 702
#define GASTALON_USER_EXISTS 703
#define GASTALON_LOGIN_INCOMPLETE 704
#define GASTALON_USER_ACTIVE 705

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
-(void)showControllerWithIdentifier:(NSString*)identifier;
-(void)showModalControllerWithIdentifier:(NSString*)identifier;
-(void)showControllerHiddingBottomBar:(NSString*)identifier;
-(UIView*)loadViewWithName:(NSString*)name;

-(void) unregisterForKeyboardNotificatons;
-(void) registerForKeyboardNotifications;

-(BOOL)validHTTPStatus:(NSError*)error;
@end

