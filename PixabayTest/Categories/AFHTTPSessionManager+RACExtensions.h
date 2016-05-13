//
//  AFHTTPSessionManager+RACExtensions.h
//  GETPET
//
//  Created by Alexander Zaporozhchenko on 1/4/16.
//  Copyright © 2016 Alexander Zaporozhchenko. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "ReactiveCocoa.h"

typedef NS_ENUM(NSUInteger, HTTPMethodType)
{
    GET,
    POST,
    HEAD,
    PUT,
    PATCH,
    DELETE
};

@interface AFHTTPSessionManager (RACExtensions)

- (RACSignal *)rac_requestWithMethod:(HTTPMethodType)method
                                 URL:(NSString *)urlString
                          parameters:(id)parameters;


- (RACSignal *)rac_POST:(NSString *)URLString
             parameters:(nullable id)parameters
constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> formData))block;


@end
