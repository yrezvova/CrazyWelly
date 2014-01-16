//
//  CWDetailViewController.h
//  ppppp
//
//  Created by Зоя Прибыткова on 15.01.14.
//  Copyright (c) 2014 Зоя Прибыткова. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CWEntity;

@interface CWDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextView *textLabel;

@property (nonatomic, strong) CWEntity *selectedEntity;

@end
