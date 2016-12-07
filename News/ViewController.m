//
//  ViewController.m
//  News
//
//  Created by Perets on 07.12.16.
//  Copyright © 2016 PeretsVictory. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"NEWS";
    NSURL *URL = [NSURL URLWithString:[self.url stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [[self webView] setDelegate:self];
    [self.webView loadRequest:request];
    
    [self.webView addSubview:_indicator];
    
    }


- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    [_indicator startAnimating];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {

    [_indicator stopAnimating];
}

@end
