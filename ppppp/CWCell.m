//
//  CWCell.m
//  CrazyWelly
//
//  Created by Зоя Прибыткова on 17.01.14.
//  Copyright (c) 2014 Зоя Прибыткова. All rights reserved.
//

#import "CWCell.h"

@implementation CWCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
