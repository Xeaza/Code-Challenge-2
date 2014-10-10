//
//  DetailViewController.m
//  Code Challenge 2
//
//  Created by Taylor Wright-Sanson on 10/10/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "DetailViewController.h"
#import "WikiViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property UIBarButtonItem *rightBarButton;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *wikiLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.nameLabel.text = self.city.name;
    self.imageView.image = self.city.image;
    if (self.city.provence) {
        self.stateLabel.text = self.city.provence;
    }
    else
    {
        self.stateLabel.text = self.city.state;
    }

    self.rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
                                                           style:UIBarButtonItemStyleDone
                                                          target:self action:@selector(onEditButtonPressed:)];
    self.navigationItem.rightBarButtonItem = self.rightBarButton;

    self.nameTextField.hidden = YES;
    self.stateTextField.hidden = YES;
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGesture
{
    CGPoint point = [tapGesture locationInView:self.view];

    if (CGRectContainsPoint(self.wikiLabel.frame, point))
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        WikiViewController *wikiViewController = [storyboard instantiateViewControllerWithIdentifier:@"WIkiViewController"];
        wikiViewController.city = self.city;
        [(DetailViewController*)self presentViewController:wikiViewController animated:YES completion:nil];
    }
}

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)rightBarButton
{
    if ([rightBarButton.title isEqualToString:@"Edit"])
    {
        [self.nameTextField becomeFirstResponder];
        self.navigationItem.rightBarButtonItem.title = @"Done";
        self.nameTextField.hidden = NO;
        self.stateTextField.hidden = NO;
        self.nameLabel.hidden = YES;
        self.stateLabel.hidden = YES;
    }
    else
    {
        rightBarButton.title = @"Edit";
        // Make sure user actually entered something. Otherwise don't change label text
        if (![self.nameTextField.text isEqualToString:@""]) {
            self.city.name = self.nameTextField.text;
            self.nameLabel.text = self.city.name;
        }
        // Make sure user actually entered something. Otherwise don't change label text
        if (![self.stateTextField.text isEqualToString:@""]) {
            if (self.city.state) {
                self.city.state = self.stateTextField.text;
                self.stateLabel.text = self.city.state;
            }
            else
            {
                self.city.provence = self.stateTextField.text;
                self.stateLabel.text = self.city.provence;
            }
        }
        self.nameTextField.hidden = YES;
        self.stateTextField.hidden = YES;

        self.nameLabel.hidden = NO;
        self.stateLabel.hidden = NO;

        [self.nameTextField resignFirstResponder];
        [self.stateTextField resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
