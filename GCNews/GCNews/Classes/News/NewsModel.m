//
//  NewsModel.m
//  GCNews
//
//  Created by p on 17/3/5.
//  Copyright © 2017年 gongcheng. All rights reserved.
//

#import "NewsModel.h"
#import "ANetworkTools.h"

@implementation NewsModel


+(instancetype)newswithDict:(NSDictionary *)dict{
    
    id obj = [[self alloc]init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}


//网络数据接口
+(void)loadNewsListWithUrlString:(NSString *)urlString{
    
    [[ANetworkTools sharedNetworkTools] GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"成功回调：%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"失败：%@",error);
    }];
    
    
    
}

@end
