//
//  MRTableView.h
//  testTableViewParallaxHeader
//
//  Created by mac on 15/6/11.
//  Copyright (c) 2015年 XR. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kParallaxHeight 250
#define kPortraitHight 100
#define kPortraitWidth 100

#define kNameWidth 100
#define kNameHeight 30

@interface MRTableView : UITableView <UITableViewDelegate>

@property (nonatomic, weak) id<UITableViewDelegate>MRDelegate;
@property (nonatomic, strong) UIImageView *parallaxImageView;
@property (nonatomic, strong) UIImageView *potraitImageView;
@property (nonatomic, strong) UILabel *nameLabel;

@end
