//
//  WikiViewController.m
//  Code Challenge 2
//
//  Created by Taylor Wright-Sanson on 10/10/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "WikiViewController.h"

@interface WikiViewController ()

@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property UIBarButtonItem *leftBarButton;

@end

@implementation WikiViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                           style:UIBarButtonItemStyleDone
                                                          target:self action:@selector(onDoneButtonPressed:)];
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:self.city.name];
    navItem.leftBarButtonItem = self.leftBarButton;
    [self.navBar pushNavigationItem:navItem animated:NO];

    NSURL *url = [NSURL URLWithString:self.city.wikiUrlString];
    NSLog(@"%@", self.city.wikiUrlString);
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (IBAction)onDoneButtonPressed:(UIBarButtonItem *)leftBarButton
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
