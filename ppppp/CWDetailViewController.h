//
//  CWDetailViewController.h
//  ppppp
//
//  Created by Зоя Прибыткова on 15.01.14.
//  Copyright (c) 2014 Зоя Прибыткова. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextView *textLabel;

@property (nonatomic, strong) NSString *titleDetail;
@property (nonatomic, strong) NSString *textDetail;

@end
