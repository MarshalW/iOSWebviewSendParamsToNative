//
//  ViewController.m
//  TestWebView
//
//  Created by Marshal Wu on 14/10/25.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "ViewController.h"
#import "NSURL+Parameters.h"
//#import "RequestUtils.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webview.delegate=self;
     NSURL *url =[NSURL URLWithString:@"http://localhost:3000/test.html"];
     NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"should load with request, %@",request.URL);
    
    if ([request.URL.scheme isEqualToString:@"local"]) {
        NSLog(@"==>>should load with request, %@",[request.URL parametersForKey:@"url"]);
        return NO;
    }

    return YES;
}

@end
