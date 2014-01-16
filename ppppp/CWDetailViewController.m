//
//  CWDetailViewController.m
//  ppppp
//
//  Created by Зоя Прибыткова on 15.01.14.
//  Copyright (c) 2014 Зоя Прибыткова. All rights reserved.
//

#import "CWDetailViewController.h"

@interface CWDetailViewController ()

@end

@implementation CWDetailViewController

@synthesize titleLabel;
@synthesize textLabel;
@synthesize titleDetail;
@synthesize textDetail;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.titleLabel.text = titleDetail;
    self.textLabel.text = textDetail;
    self.title = titleDetail;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
