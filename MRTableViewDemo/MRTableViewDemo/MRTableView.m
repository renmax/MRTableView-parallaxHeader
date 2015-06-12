//
//  MRTableView.m
//  testTableViewParallaxHeader
//
//  Created by mac on 15/6/11.
//  Copyright (c) 2015年 XR. All rights reserved.
//

#import "MRTableView.h"

@implementation MRTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.contentInset = UIEdgeInsetsMake(kParallaxHeight, 0, 0, 0);
        self.delegate = self;
        
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    _parallaxImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -kParallaxHeight, self.frame.size.width, kParallaxHeight)];
    
    _potraitImageView = [[UIImageView alloc] initWithFrame:CGRectMake((_parallaxImageView.frame.size.width - kPortraitWidth)/2, (_parallaxImageView.frame.size.height - kPortraitHight)/2, kPortraitWidth, kPortraitHight)];
   
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake((_parallaxImageView.frame.size.width - kNameWidth)/2, (_parallaxImageView.frame.size.height + _potraitImageView.frame.size.height)/2, kNameWidth, kNameHeight)];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    
    [_parallaxImageView addSubview:_potraitImageView];
    [_parallaxImageView addSubview:_nameLabel];
    [self addSubview:_parallaxImageView];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.MRDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.MRDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellHeight = 44;
    if ([self.MRDelegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
       cellHeight = [self.MRDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    return cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    CGFloat sectionFooterHeight = 0;
    if ([self.MRDelegate respondsToSelector:@selector(tableView:heightForFooterInSection:)]) {
        sectionFooterHeight = [self.MRDelegate tableView:tableView heightForFooterInSection:section];
    }
    return sectionFooterHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat sectionHeaderHeight = 0;
    if ([self.MRDelegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)]) {
        sectionHeaderHeight = [self.MRDelegate tableView:tableView heightForHeaderInSection:section];
    }
    return sectionHeaderHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *sectionFooterView;
    if ([self.MRDelegate respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
       sectionFooterView = [self.MRDelegate tableView:tableView viewForFooterInSection:section];
    }
    return sectionFooterView;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionHeaderView;
    if ([self.MRDelegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
        sectionHeaderView = [self.MRDelegate tableView:tableView viewForHeaderInSection:section];
    }
    return sectionHeaderView;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat yOff  = scrollView.contentOffset.y;
    if (yOff < - kParallaxHeight) {
        self.parallaxImageView.frame = CGRectMake(self.parallaxImageView.frame.origin.x, yOff, self.parallaxImageView.frame.size.width, -yOff);
        self.potraitImageView.frame = CGRectMake(self.potraitImageView.frame.origin.x, (_parallaxImageView.frame.size.height - kPortraitHight)/2, kPortraitWidth, kPortraitHight);
        self.nameLabel.frame = CGRectMake(self.nameLabel.frame.origin.x, (_parallaxImageView.frame.size.height + _potraitImageView.frame.size.height)/2, kNameWidth, kNameHeight);
    }

    if ([self.MRDelegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.MRDelegate scrollViewDidScroll:scrollView];
    }
}

@end
