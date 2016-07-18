//
//  RequestManager.h
//  18UILessonCocoapods
//
//  Created by UntilYou-QC on 16/6/16.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import <Foundation/Foundation.h>
// 这个类是基于对AFNetWorking的一个二次封装

// 请求方式的枚举
typedef NS_ENUM(NSInteger, RequestType) {
    requestGET, // get请求
    requestPOST // post请求
};

// 请求成功回调的block
typedef void (^Finish)(NSData *data);
// 请求失败回调的block
typedef void (^Error)(NSError *error);

@interface RequestManager : NSObject
// block属性
@property (nonatomic, copy) Finish finish;
@property (nonatomic, copy) Error error;

// 给controller提供的接口 传进来字符串网址 字典 请求类型 成功block 失败block
+ (void)requestWithUrlString:(NSString *)urlString requestType:(RequestType)requestType parDic:(NSDictionary *)parDic finish:(Finish)finish error:(Error)error;

@end
