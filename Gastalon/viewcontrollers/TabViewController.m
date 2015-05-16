//
//  TabViewController.m
//  Gastalon
//
//  Created by Mobile Developer on 1/7/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "TabViewController.h"
#import "Statics.h"
#import "Colors.h"
#import "FCVerticalMenu.h"

@interface TabViewController ()<FCVerticalMenuDelegate>
@end

@implementation TabViewController{
    BOOL menuOpened;
    FCVerticalMenu * verticalMenu;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    menuOpened = NO;
    [self designTabBar];
    [self setNeedsStatusBarAppearanceUpdate];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


-(void)designTabBar{
    UITabBarController *tabBarController = [self tabBarController];
    UITabBar *tabBar = tabBarController.tabBar;
    tabBar.tintColor = [UIColor whiteColor];
    NSArray * selectedImages = [[NSArray alloc] initWithObjects:@"IconTabHomeSelected.png",@"IconTabAccountsSelected.png",@"IconTabChartsSelected.png",@"IconTabCalendarSelected.png",@"IconTabSettingsSelected.png", nil];
    int i = 0;
    for (UITabBarItem  *tab in tabBar.items) {
        tab.image = [tab.image imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
        tab.selectedImage = [[UIImage imageNamed:selectedImages[i]] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
        [tab setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:.52], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
        [tab setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
        i++;
    }
}

-(void)designMenuItemsAccount{
    FCVerticalMenuItem *addAccount = [[FCVerticalMenuItem alloc] initWithTitle:@"Account" andIconImage:[UIImage imageNamed:@"IconAddAccount"]];
    FCVerticalMenuItem *addSharedAccount = [[FCVerticalMenuItem alloc] initWithTitle:@"Shared Account" andIconImage:[UIImage imageNamed:@"IconAddSharedAccount"]];
    FCVerticalMenuItem *cancel = [[FCVerticalMenuItem alloc] initWithTitle:@"Cancel" andIconImage:[UIImage imageNamed:@"IconCancel"]];
    verticalMenu = [[FCVerticalMenu alloc] initWithItems:@[addAccount, addSharedAccount, cancel]];
    verticalMenu.delegate = self;
    verticalMenu.appearsBehindNavigationBar = YES;
    verticalMenu.liveBlur = YES;
    verticalMenu.liveBlurTintColor = GASTALON_COLOR_ALPHA;
    verticalMenu.liveBlurBackgroundStyle = UIBlurEffectStyleExtraLight;
    verticalMenu.highlightedBackgroundColor = GASTALON_COLOR_ALPHA;
    verticalMenu.animationDuration = 0.3f;
    verticalMenu.borderWidth = 0.0f;
    verticalMenu.borderColor = [UIColor clearColor];
    verticalMenu.closeAnimationDuration = 0.3f;
    verticalMenu.bounceAnimationDuration = 0.1f;
    for (FCVerticalMenuItem *anItem in verticalMenu.items) {
        anItem.borderColor = [UIColor clearColor];
    }
    addAccount.actionBlock = ^{
        [self showModalControllerWithIdentifier:@"ADDACCOUNTCONTROLLER"];
    };
    addSharedAccount.actionBlock = ^{
        [self showModalControllerWithIdentifier:@"ADDSHAREDACCOUNTCONTROLLER"];
    };
    cancel.actionBlock = ^{};
}

-(void)openMenu{
    if(!menuOpened){
        [verticalMenu showFromNavigationBar:self.navigationController.navigationBar inView:self.view];
    }else{
        [verticalMenu dismissWithCompletionBlock:nil];
    }
}

-(void)menuWillOpen:(FCVerticalMenu *)menu{
    menuOpened = YES;
    [self.btnAdd setImage:[UIImage imageNamed:@"IconArrowDown"]];
}

-(void)menuWillClose:(FCVerticalMenu *)menu{
    menuOpened = NO;
    [self.btnAdd setImage:[UIImage imageNamed:@"IconAdd"]];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if(verticalMenu)
        [verticalMenu dismissWithCompletionBlock:nil];
}


-(void)viewWillAppear:(BOOL)animated{

}
@end
