//
//  NewsTableViewController.m
//  GCNews
//
//  Created by p on 17/2/26.
//  Copyright © 2017年 gongcheng. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsModel.h"
#import "NewsTableViewCell.h"

@interface NewsTableViewController ()
@property(nonatomic, strong) NSArray *newsList;
@end

@implementation NewsTableViewController

-(void)setNewsList:(NSArray *)newsList{
    _newsList = newsList;
    
    //刷新表格
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass :[NewsTableViewCell class] forCellReuseIdentifier:@"NewsTableViewCell"];

    //测试加载新闻数据
    __weak typeof (self) weakSelf = self;
    [NewsModel loadNewsListWithUrlString:@"T1348647853363/0-20.html" finished:^(NSArray *newsList) {
        
        NSLog(@"外部调用%@", newsList);
        weakSelf.newsList = newsList;
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsTableViewCell" forIndexPath:indexPath];
 
    cell.news = self.newsList[indexPath.row];
    
    return cell;
}


@end
