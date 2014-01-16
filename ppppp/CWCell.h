//
//  CWCell.h
//  CrazyWelly
//
//  Created by Зоя Прибыткова on 17.01.14.
//  Copyright (c) 2014 Зоя Прибыткова. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end
