//
//  EcoColleagueZoneTableViewCell.m
//  ColleagueZone
//
//  Created by Evan Yang on 2020/10/24.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

#import "EcoColleagueZoneTableViewCell.h"
#import "EcoHotPostHeaderView.h"
#import "EcoCommentView.h"
#import "EcoColleagueZoneVideoView.h"
#import <AVFoundation/AVFoundation.h>

@implementation EcoColleagueZoneTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return self;
}

-(void)setupSubViews{
    EcoHotPostHeaderView *heaerView = [[EcoHotPostHeaderView alloc]init];
    [self addSubview:heaerView];
    [heaerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
    }];
    heaerView.backgroundColor = UIColor.lightGrayColor;
    heaerView.dataList = [NSMutableArray array];
    
    EcoCommentView *commentView = [[EcoCommentView alloc]init];
    [self addSubview:commentView];
    [commentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(heaerView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
    commentView.backgroundColor = UIColor.whiteColor;
    
    EcoColleagueZoneVideoView *videoView = [[EcoColleagueZoneVideoView alloc]init];
    [self addSubview:videoView];
    [videoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(commentView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(250);
    }];
    videoView.backgroundColor = UIColor.brownColor;
}

@end
