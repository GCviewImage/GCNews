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
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;
@end

@implementation NewsTableViewCell


-(void)setNews:(NewsModel *)news{
    _news = news;
    
    self.titleLabel.text = news.ltitle;
    self.digestLabel.text = news.source;
    self.replyLabel.text = [NSString stringWithFormat:@"%d跟帖", news.replyCount];
    
    [self.icanView setImageWithURL: [NSURL URLWithString:news.imgsrc]];

}

- (void)awakeFromNib {
    
    self.titleLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - self.digestLabel.frame.origin.x - 16;
    
    self.digestLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - self.digestLabel.frame.origin.x - 250;



}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
