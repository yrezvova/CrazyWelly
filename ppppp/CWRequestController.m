//
//  CWRequestController.m
//  CrazyWelly
//
//  Created by Зоя Прибыткова on 16.01.14.
//  Copyright (c) 2014 Зоя Прибыткова. All rights reserved.
//

#import "CWRequestController.h"

@implementation CWRequestController

+ (id)getCollectonWithURL:(NSURL *)requestURL
{
    NSURLRequest *request = [CWRequestController createRequestWithURL:requestURL];
    NSHTTPURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error != nil) {
        return error;
    }
    if ([response statusCode] != 200) {
        NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        error = [[NSError alloc] initWithDomain:[NSString stringWithFormat:@"%@", requestURL] code:[response statusCode] userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseStr, @"error", nil]];
        return error;
    }
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    if (error != nil) {
        return error;
    }
    if (![jsonObjects isKindOfClass:[NSArray class]]) {
        error = [[NSError alloc] initWithDomain:[NSString stringWithFormat:@"%@", requestURL] code:300 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Invalid Model", @"error", nil]];
        return error;
    }
    return jsonObjects;
}

+ (NSURLRequest *)createRequestWithURL:(NSURL *)requestURL
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:requestURL];
    [request setHTTPMethod:@"GET"];
    return request;
}

@end
