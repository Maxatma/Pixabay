//
//  ViewController.m
//  PixabayTest
//
//  Created by Alexander Zaporozhchenko on 5/12/16.
//  Copyright © 2016 Alexander Zaporozhchenko. All rights reserved.
//

#import "PBHitsListVC.h"
#import "PBHitService.h"
#import "PBHitCell.h"
#import "PBHit.h"
#import "PBFullImageVC.h"


static NSString * const kShowDetailSegue = @"showDetail";
static CGFloat const kRowHeight          = 80.0f;

@interface PBHitsListVC () < UITableViewDelegate, UITableViewDataSource >
@property (weak, nonatomic  ) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray     *hits;
@end

@implementation PBHitsListVC

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Images";
    [self reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _hits.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PBHitCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PBHitCell class])];
    PBHit *hit      = _hits[indexPath.row];
    [cell configureWithHit:hit];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PBHit *selectedHit = _hits[indexPath.row];
    [self pushFullImageVCWithHit:selectedHit];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kRowHeight;
}

#pragma mark - Private

- (void)reloadData
{
    [[[PBHitService sharedInstance] getPBHits]
     subscribeNext:^(NSArray *x) {
         _hits = x;
         [_tableView reloadData];
     }
     error:^(NSError *error) {
         NSLog(@"error : %@",error);
     }];
}

- (void)pushFullImageVCWithHit:(PBHit *)hit
{
    PBFullImageVC *vc  = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([PBFullImageVC class])];
    vc.fullImageURL    = hit.webformatURL;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
