//
//  ANetworkTools.h
//  GCNews
//
//  Created by p on 17/2/26.
//  Copyright © 2017年 gongcheng. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface ANetworkTools : AFHTTPSessionManager

// 网络单例
+(instancetype)sharedNetworkTools;


@end
