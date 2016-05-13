//
//  PBHitCell.m
//  PixabayTest
//
//  Created by Alexander Zaporozhchenko on 5/13/16.
//  Copyright © 2016 Alexander Zaporozhchenko. All rights reserved.
//

#import "PBHitCell.h"
#import "PBHit.h"
#import "UIImageView+WebCache.h"

@interface PBHitCell ()
@property (weak, nonatomic) IBOutlet UIImageView *previewImage;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;

@end

@implementation PBHitCell
- (void)configureWithHit:(PBHit *)hit
{
  [_previewImage sd_setImageWithURL:hit.previewURL
                   placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    _userLabel.text = [NSString stringWithFormat:@"Posted by :%@", hit.user];
    _tagLabel.text  = hit.tags;
}

@end
