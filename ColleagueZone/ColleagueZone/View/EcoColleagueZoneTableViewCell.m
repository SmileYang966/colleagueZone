//
//  EcoColleagueZoneTableViewCell.m
//  ColleagueZone
//
//  Created by Evan Yang on 2020/10/24.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

#import "EcoColleagueZoneTableViewCell.h"
#import "EcoHotPostHeaderView.h"

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
}

@end
