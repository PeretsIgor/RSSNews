//
//  ViewController.h
//  News
//
//  Created by Perets on 07.12.16.
//  Copyright © 2016 PeretsVictory. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) NSString *url;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end

