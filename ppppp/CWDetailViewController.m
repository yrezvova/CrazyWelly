//
//  CWDetailViewController.m
//  ppppp
//
//  Created by Зоя Прибыткова on 15.01.14.
//  Copyright (c) 2014 Зоя Прибыткова. All rights reserved.
//

#import "CWDetailViewController.h"
#import "CWEntity.h"

@interface CWDetailViewController ()

@end

@implementation CWDetailViewController
@synthesize titleLabel;
@synthesize textLabel;

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
    self.titleLabel.text = self.selectedEntity.title;
    self.textLabel.text = self.selectedEntity.text;
    self.title = self.selectedEntity.title;
    
    
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
