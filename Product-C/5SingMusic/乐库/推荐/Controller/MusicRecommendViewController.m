//
//  MusicRecommendViewController.m
//  Product-C
//
//  Created by UntilYou-QC on 16/7/15.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import "MusicRecommendViewController.h"
#import "MusicRecommendTableView.h"
#import "ModelOfTjADV.h"
#import "ModelOfTjDAY.h"
#import "ModelOfTjGeDan.h"
#import "ModelOfTjLive.h"
#import "ModelOfTjItems.h"
#import "MusicOfTjItemsDetailViewController.h"

@interface MusicRecommendViewController ()
@property (nonatomic, strong) MusicRecommendTableView *musicRecommendTV;
@property (nonatomic, strong) NSMutableArray *modelArrayOfTjADV;
@property (nonatomic, strong) NSMutableArray *modelArrayOfTjDAY;
@property (nonatomic, strong) NSMutableArray *modelArrayOfTjGeDan;
@property (nonatomic, strong) NSMutableArray *modelArrayOfTjLive;
@property (nonatomic, strong) NSMutableArray *modelArrayOfTjItems;

@end

@implementation MusicRecommendViewController
- (MusicRecommendTableView *)musicRecommendTV {
    if (!_musicRecommendTV) {
        _musicRecommendTV = [[MusicRecommendTableView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, KScreenH - 49 - 64)];
    }
    return _musicRecommendTV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.musicRecommendTV];
    [self requestTjAdvData];
    [self requestTjDayData];
    [self requestTjGeDanData];
    [self requestTjLiveData];
    [self requestTjItemsData];
    [self pushDetailViewControllerWhenSelected];
}

- (void)requestTjAdvData {
    [RequestManager requestWithUrlString:TjADVUrl requestType:requestGET parDic:nil finish:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.modelArrayOfTjADV = [ModelOfTjADV modelConfiguredByJson:dic];
        // 刷新广告数据
        self.musicRecommendTV.modelArrayOfTjADV = self.modelArrayOfTjADV;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableView" object:nil];
    } error:^(NSError *error) {
        NSLog(@"error ========== %@", error);
    }];
}

- (void)requestTjDayData {
    [RequestManager requestWithUrlString:TjdayUrl requestType:requestGET parDic:nil finish:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.modelArrayOfTjDAY = [ModelOfTjDAY modelConfiguredByJson:dic];
        // 刷新每日推荐数据
        self.musicRecommendTV.modelArrayOfTjDAY = self.modelArrayOfTjDAY;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableView" object:nil];
    } error:^(NSError *error) {
        NSLog(@"error ========= %@", error);
    }];
}

- (void)requestTjGeDanData {
    [RequestManager requestWithUrlString:TjGeDanUrl requestType:requestGET parDic:nil finish:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.modelArrayOfTjGeDan = [ModelOfTjGeDan modelConfiguredByJson:dic];
        // 刷新推荐歌单数据
        self.musicRecommendTV.modelArrayOfTjGeDan = self.modelArrayOfTjGeDan;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableView" object:nil];
    } error:^(NSError *error) {
        NSLog(@"error ========= %@", error);
    }];
}

- (void)requestTjLiveData {
    [RequestManager requestWithUrlString:TjLiveUrl requestType:requestGET parDic:nil finish:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.modelArrayOfTjLive = [ModelOfTjLive modelConfiguredByJson:(NSArray *)dic];
        // 刷新推荐直播数据
        self.musicRecommendTV.modelArrayOfTjLive = self.modelArrayOfTjLive;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableView" object:nil];
    } error:^(NSError *error) {
        NSLog(@"error ======== %@", error);
    }];
}

- (void)requestTjItemsData {
    [RequestManager requestWithUrlString:TjZhuanTiUrl requestType:requestGET parDic:nil finish:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.modelArrayOfTjItems = [ModelOfTjItems modelConfiguredByJson:dic];
        // 刷新推荐直播数据
        self.musicRecommendTV.modelArrayOfTjItems = self.modelArrayOfTjItems;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableView" object:nil];
    } error:^(NSError *error) {
        NSLog(@"error ======== %@", error);
    }];
}

// 点击跳转
- (void)pushDetailViewControllerWhenSelected {
    __weak MusicRecommendViewController *recommendVC = self;
    
    recommendVC.musicRecommendTV.DayPush = ^(NSString *type, NSString *songID) {
        MusicPlayerViewController *musicPlayerVC = [MusicPlayerViewController sharedMusicPlayerWithSongType:type songID:songID];
        [recommendVC.myParentVC.navigationController pushViewController:musicPlayerVC animated:YES];
    };
    
    recommendVC.musicRecommendTV.ItemsPush = ^(NSString *url, NSString *title) {
        MusicOfTjItemsDetailViewController *tjItemsDetailVC = [[MusicOfTjItemsDetailViewController alloc] init];
        tjItemsDetailVC.url = url;
        tjItemsDetailVC.midTitle = title;
        [recommendVC.myParentVC.navigationController pushViewController:tjItemsDetailVC animated:YES];
    };
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
