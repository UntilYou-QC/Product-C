//
//  LoginAndRegistView.m
//  Product-C
//
//  Created by UntilYou-QC on 16/7/19.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import "LoginAndRegistView.h"
#import "LoginViewController.h"
#import "MessageLoginViewController.h"
#import "DownloadListViewController.h"

@implementation LoginAndRegistView

- (IBAction)loginAction:(UIButton *)sender {
    [self.MyParentVC.navigationController pushViewController:[[LoginViewController alloc] init] animated:YES];
}

- (IBAction)RegistAction:(UIButton *)sender {
}

- (IBAction)messageRegistAction:(UIButton *)sender {
    [self.MyParentVC.navigationController pushViewController:[[MessageLoginViewController alloc] init] animated:YES];
}

- (IBAction)downloadList:(UIButton *)sender {
    [self.MyParentVC.navigationController pushViewController:[DownloadListViewController sharedDownloadListWithSongModel:nil] animated:YES];
}

@end
