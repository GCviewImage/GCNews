//
//  ANetworkTools.m
//  GCNews
//
//  Created by p on 17/2/26.
//  Copyright © 2017年 gongcheng. All rights reserved.
//

#import "ANetworkTools.h"

@implementation ANetworkTools

+(instancetype)sharedNetworkTools{
    
    static ANetworkTools *instance;
    static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            //后续可以相对路径，但是必须以“/”结尾
            NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
            
            instance = [[self alloc]initWithBaseURL:url];
        });
        
    return instance;
}



@end
