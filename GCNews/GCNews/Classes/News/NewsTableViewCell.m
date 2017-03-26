//
//  NewsTableViewCell.m
//  GCNews
//
//  Created by p on 17/3/18.
//  Copyright © 2017年 gongcheng. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "NewsModel.h"
#import <UIImageView+AFNetworking.h>

@interface NewsTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *icanView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *extralImageViews;


@end

@implementation NewsTableViewCell


-(void)setNews:(NewsModel *)news{
    _news = news;
    
    self.titleLabel.text = news.ltitle;
    self.sourceLabel.text = news.source;
    self.replyLabel.text = [NSString stringWithFormat:@"%d跟帖", news.replyCount];
    
    //设置配图
    [self.icanView setImageWithURL: [NSURL URLWithString:news.imgsrc]];
    
    if (self.extralImageViews.count == 2) {
        
        int index = 0;
        for (UIImageView *iv in self.extralImageViews) {
            
            NSString *urlString = news.imgextra[index][@"imgsrc"];
            
            NSURL *url = [NSURL URLWithString:urlString];
            [iv setImageWithURL:url];
            index ++;
        }
    }
}


+(NSString *)cellIdentifier:(NewsModel *)news{
    
    if (news.imgextra.count == 2) {
        return @"imgextCell";
    }if (news.isBigImage == 1) {
        return @"BigimageCell";
    }
    return @"NewsTableViewCell";
}


- (void)awakeFromNib {
    
    self.titleLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - self.sourceLabel.frame.origin.x - 16;


}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
