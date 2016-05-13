//
//  PBHitCell.h
//  PixabayTest
//
//  Created by Alexander Zaporozhchenko on 5/13/16.
//  Copyright © 2016 Alexander Zaporozhchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PBHit;

@interface PBHitCell : UITableViewCell
- (void)configureWithHit:(PBHit *)hit;
@end
