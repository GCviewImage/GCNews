//
//  NSObject+Extension.m
//  GCNews
//
//  Created by p on 17/3/26.
//  Copyright © 2017年 gongcheng. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)

+(instancetype)objWithDict:(NSDictionary *)dict{
    
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




const char *kPropertyKey = "PropertyKey";
+(NSArray *)loadList{
    
    NSArray *arrayKey = objc_getAssociatedObject(self, kPropertyKey);
    if (arrayKey != nil) {
        return arrayKey;
    }
    
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
    
    objc_setAssociatedObject(self, kPropertyKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return objc_getAssociatedObject(self, kPropertyKey);
}

@end
