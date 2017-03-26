//
//  NewsModel.h
//  GCNews
//
//  Created by p on 17/3/5.
//  Copyright © 2017年 gongcheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

// 新闻标题
@property (nonatomic, copy) NSString *title;

// 新闻摘要
@property (nonatomic, copy) NSString *source;

// 新闻跟帖数
@property (nonatomic, assign) int replyCount;

//配图地址
@property (nonatomic, copy) NSString *imgsrc;

//多图地址
@property (nonatomic, strong) NSArray *imgextra;

//大图
@property (nonatomic, assign, getter = isBigImage) BOOL imgType;

//
//// 字典转模型
//+(instancetype)newsWithDict:(NSDictionary *)dict;

//加载指定网络数据接口
+(void)loadNewsListWithUrlString: (NSString *)urlString finished: (void (^)(NSArray *v))finished;

@end
