//
//  CWEntity.h
//  CrazyWelly
//
//  Created by Зоя Прибыткова on 17.01.14.
//  Copyright (c) 2014 Зоя Прибыткова. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWEntity : NSObject

@property (strong, nonatomic, readonly) NSNumber *entityID;
@property (strong, nonatomic, readonly) NSString *text;
@property (strong, nonatomic, readonly) NSString *title;

+ (NSArray *)createEntityCollectionWithArray:(NSArray *)array;

@end
