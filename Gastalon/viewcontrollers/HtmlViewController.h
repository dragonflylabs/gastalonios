//
//  HtmlViewController.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 4/1/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"

@interface HtmlViewController : ViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NSString * typeHtml;
@property (nonatomic, assign) BOOL isShowingWebPage;

@end
