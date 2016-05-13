//
//  PBHit.h
//  PixabayTest
//
//  Created by Alexander Zaporozhchenko on 5/12/16.
//  Copyright © 2016 Alexander Zaporozhchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FEMMapping.h"

@interface PBHit : NSObject

@property (nonatomic, copy) NSURL    *previewURL;
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, copy) NSString *user;
@property (nonatomic, copy) NSURL    *webformatURL;

+ (FEMMapping *)defaultMapping;

@end
