//
//  CWViewController.h
//  ppppp
//
//  Created by Зоя Прибыткова on 14.01.14.
//  Copyright (c) 2014 Зоя Прибыткова. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)refreshButton:(id)sender;

@end
