//
//  PBApiManager.m
//  PixabayTest
//
//  Created by Alexander Zaporozhchenko on 5/12/16.
//  Copyright © 2016 Alexander Zaporozhchenko. All rights reserved.
//

#import "PBApiManager.h"
#import "AFHTTPSessionManager+RACExtensions.h"

@interface PBApiManager ()
@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end

static NSString * const kDefaultSearchString = @"red roses";
static NSString * const kApiKey              = @"2558715-0fea309eb5cf824cd64a2e01f";

static NSString * const kBaseURL      = @"https://pixabay.com/api/";
static NSString * const kKey          = @"key";
static NSString * const kSearchString = @"q";



@implementation PBApiManager

#pragma mark - Initialization

+ (instancetype)sharedManager
{
    static PBApiManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [self new];
    });
    
    return sharedManager;
}

- (instancetype) init
{
    self                              = [super init];
    NSURL *baseURL                    = [NSURL URLWithString:kBaseURL];
    _sessionManager                   = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    return self;
}

#pragma mark - Public

- (RACSignal *)loadImagesWithDefaultSearchString
{
    
    NSDictionary *parameters = @{ kKey : kApiKey,
                                  kSearchString : kDefaultSearchString
                                 };
    
    NSLog(@"PBApiManager loadImagesWithDefaultSearchString : %@",parameters);
    
    return [_sessionManager rac_requestWithMethod:GET
                                              URL:@""
                                       parameters:parameters];
}

@end
