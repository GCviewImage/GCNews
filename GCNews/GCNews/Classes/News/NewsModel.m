//
//  NewsModel.m
//  GCNews
//
//  Created by p on 17/3/5.
//  Copyright © 2017年 gongcheng. All rights reserved.
//

#import "NewsModel.h"
#import "ANetworkTools.h"
#import <objc/runtime.h>

@implementation NewsModel


+(instancetype)newsWithDict:(NSDictionary *)dict{
    
    id obj = [[self alloc]init];
    
    // 手动遍历需要的数据
    NSArray *propertis = [self loadList];
    for (NSString *key in propertis) {
        if (dict[key] != nil) {
            [obj setValue:dict[key] forKeyPath:key];
        }
    }
    //    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}


// 数据完整显示
-(NSString *)description{
    NSArray *propertis = [self.class loadList];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:propertis];
    
    return [NSString stringWithFormat:@"%@,%p,%@",self.class,self,dict];
}


//统一调用这个方法遍历模型数据
+(NSArray *)loadList{
    
    unsigned int count = 0;
    
   objc_property_t *list = class_copyPropertyList([self class], &count);
    
    //遍历数组，动态获取属性名称
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    
    for (unsigned int i = 0; i < count; ++i) {
        
        objc_property_t pry = list[i];
        
        const char *cName = property_getName(pry);
        
        [arrayM addObject:[NSString stringWithUTF8String:cName]];
    }
    NSLog(@"%@",arrayM);
    
    free(list);

    return arrayM;
}


//网络数据接口
+(void)loadNewsListWithUrlString:(NSString *)urlString{
    
    [[ANetworkTools sharedNetworkTools] GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
    
        //keyEnumerator 这个属性可以拿到字典中的第一个 Key
//        NSLog(@"%@",responseObject.keyEnumerator.nextObject);
        
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        NSLog(@"删选后的数据%@",array);
        
        // 字典转模型
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        
        for (NSDictionary *obj in array) {
            [arrayM addObject:[self newsWithDict:obj]];
            
        }
        NSLog(@"字典转模型%@", arrayM);

//        NSLog(@"成功回调：%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"失败：%@",error);
    }];
    
    
    
}

@end
