//
//  PBFullImageVC.m
//  PixabayTest
//
//  Created by Alexander Zaporozhchenko on 5/13/16.
//  Copyright © 2016 Alexander Zaporozhchenko. All rights reserved.
//

#import "PBFullImageVC.h"
#import "UIImageView+WebCache.h"

@interface PBFullImageVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PBFullImageVC

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Image";
    [_imageView sd_setImageWithURL:_fullImageURL
                  placeholderImage:[UIImage imageNamed:@"placeholder"]];
}

@end
