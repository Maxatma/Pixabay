//
//  PBApiManager.h
//  PixabayTest
//
//  Created by Alexander Zaporozhchenko on 5/12/16.
//  Copyright © 2016 Alexander Zaporozhchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa.h"


@interface PBApiManager : NSObject
+ (instancetype)sharedManager;
- (RACSignal *)loadImagesWithDefaultSearchString;


@end
