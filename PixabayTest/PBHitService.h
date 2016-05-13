//
//  PBHitService.h
//  PixabayTest
//
//  Created by Alexander Zaporozhchenko on 5/12/16.
//  Copyright © 2016 Alexander Zaporozhchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACSignal.h"

@interface PBHitService : NSObject
+ (instancetype)sharedInstance;
- (RACSignal *)getPBHits;

@end
