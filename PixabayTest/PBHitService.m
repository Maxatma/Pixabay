//
//  PBHitService.m
//  PixabayTest
//
//  Created by Alexander Zaporozhchenko on 5/12/16.
//  Copyright © 2016 Alexander Zaporozhchenko. All rights reserved.
//

#import "PBHitService.h"
#import "PBApiManager.h"
#import "FEMMapping.h"
#import "PBHit.h"
#import "FEMDeserializer.h"

@implementation PBHitService

+ (instancetype)sharedInstance
{
    static PBHitService *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self new];
    });
    
    return sharedInstance;
}

- (RACSignal *)getPBHits
{
    
    return  [[[PBApiManager sharedManager] loadImagesWithDefaultSearchString] map:^id(id response) {
        FEMMapping *mapping      = [PBHit defaultMapping];
        NSArray *hits            = [FEMDeserializer collectionFromRepresentation:response
                                                                         mapping:mapping];
        return hits;
        
    }];
}


@end
