//
//  PBHit.m
//  PixabayTest
//
//  Created by Alexander Zaporozhchenko on 5/12/16.
//  Copyright © 2016 Alexander Zaporozhchenko. All rights reserved.
//

#import "PBHit.h"

@implementation PBHit

+ (FEMMapping *)defaultMapping
{
    FEMMapping *mapping = [[FEMMapping alloc] initWithObjectClass:self];
    mapping.rootPath    = @"hits";
    [mapping addAttributesFromArray:@[@"previewURL", @"tags", @"user", @"webformatURL"]];
    
    return mapping;
}

@end
