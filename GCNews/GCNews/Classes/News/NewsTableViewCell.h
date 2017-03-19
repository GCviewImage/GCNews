//
//  NewsTableViewCell.h
//  GCNews
//
//  Created by p on 17/3/18.
//  Copyright © 2017年 gongcheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewsModel;
@interface NewsTableViewCell : UITableViewCell

@property (nonatomic, strong) NewsModel *news;

@end
