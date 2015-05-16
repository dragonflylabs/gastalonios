//
//  HtmlViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 4/1/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "HtmlViewController.h"

@implementation HtmlViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    if(self.isShowingWebPage){
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.typeHtml]]];
    }else{
        NSString *path = [[NSBundle mainBundle] pathForResource:self.typeHtml ofType:@"html"];
        NSString *html = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        [self.webView loadHTMLString:html baseURL:[[NSBundle mainBundle] bundleURL]];
        self.webView.delegate = self;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *function = [[NSString alloc] initWithFormat: @"test(%@)", @"Muestra esto en la WebView"];
    NSString *result = [self.webView stringByEvaluatingJavaScriptFromString:function];
    NSLog(@"Result: %@", result);
}
@end
