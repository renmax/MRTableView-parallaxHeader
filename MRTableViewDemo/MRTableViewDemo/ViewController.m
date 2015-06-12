//
//  ViewController.m
//  MRTableViewDemo
//
//  Created by mac on 15/6/12.
//  Copyright (c) 2015年 XR. All rights reserved.
//

#import "ViewController.h"
#import "MRTableView.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MRTableView *tableView = [[MRTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.MRDelegate = self;
    tableView.dataSource = self;
    
    
    [tableView.potraitImageView.layer setMasksToBounds:YES];
    [tableView.potraitImageView.layer setCornerRadius:tableView.potraitImageView.frame.size.height /2];
    tableView.parallaxImageView.image = [UIImage imageNamed:@"parallax"];
    tableView.potraitImageView.image = [UIImage imageNamed:@"portrait"];
    
    tableView.nameLabel.font = [UIFont boldSystemFontOfSize:18];
    tableView.nameLabel.textColor = [UIColor whiteColor];
    tableView.nameLabel.text = @"hello,world!";
    
    
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"testCell"];
    
    [self.view addSubview:tableView];

}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell"];
    cell.textLabel.text = @"test";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"select indexpath :%@", indexPath);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollview yoff :%f", scrollView.contentOffset.y);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


@end
