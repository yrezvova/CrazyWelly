//
//  CWEntity.m
//  CrazyWelly
//
//  Created by Зоя Прибыткова on 17.01.14.
//  Copyright (c) 2014 Зоя Прибыткова. All rights reserved.
//

#import "CWEntity.h"

@interface CWEntity()

@property (strong, nonatomic, readwrite) NSNumber *entityID;
@property (strong, nonatomic, readwrite) NSString *text;
@property (strong, nonatomic, readwrite) NSString *title;

@end

@implementation CWEntity

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.entityID = [dict objectForKey:@"id"];
        self.title = [dict objectForKey:@"title"];
        self.text = [dict objectForKey:@"text"];
    }
    return self;
}

+ (NSArray *)createEntityCollectionWithArray:(NSArray *)array
{
    NSMutableArray *entityArray = [NSMutableArray array];
    for (NSDictionary *entity in array) {
        [entityArray addObject:[[CWEntity alloc] initWithDict:entity]];
    }
    return entityArray;
}


@end
