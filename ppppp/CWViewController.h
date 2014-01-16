//
//  CWViewController.h
//  ppppp
//
//  Created by Зоя Прибыткова on 14.01.14.
//  Copyright (c) 2014 Зоя Прибыткова. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *jResult;

- (IBAction)refreshButton:(id)sender;

@end
