//
//  ViewController.m
//  UIWebViewDemo
//
//  Created by yihong on 16/4/11.
//  Copyright © 2016年 yihong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *go;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *update;

@end

@implementation ViewController
- (IBAction)back:(id)sender {
    [self.webView goBack];
}
- (IBAction)go:(id)sender {
    [self.webView goForward];
}
- (IBAction)update:(id)sender {
    [self.webView reload];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    
}

#pragma mark - webViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{

}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.back.enabled = webView.canGoBack;
    self.go.enabled = webView.canGoForward;

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    self.back.enabled = webView.canGoBack;
    self.go.enabled = webView.canGoForward;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"--------%@",request.URL);
    return YES;
}


@end
