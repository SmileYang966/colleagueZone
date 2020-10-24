//
//  EcoHotPostHeaderView.m
//  ColleagueZone
//
//  Created by Evan Yang on 2020/10/24.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

#import "EcoHotPostHeaderView.h"

@interface EcoHotPostHeaderView()

@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UILabel *userName;
@property(nonatomic,strong)UILabel *createTimeLabel;
@property(nonatomic,strong)UIView *zhiDingView;

@end

@implementation EcoHotPostHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}

-(void)setupSubViews{
    //1.图标
    UIImageView *icon = [[UIImageView alloc]init];
    [self addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.width.height.mas_equalTo(60);
        make.bottom.mas_equalTo(-10);
    }];
    icon.layer.cornerRadius = 30;
    icon.layer.masksToBounds = YES;
    icon.backgroundColor = UIColor.redColor;
    
    //2.Name
    UILabel *userName = [[UILabel alloc]init];
    [self addSubview:userName];
    [userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(icon.mas_right).offset(5);
        make.top.mas_equalTo(icon.mas_top).offset(5);
    }];
    userName.text = @"文化E次方";
    self.userName = userName;
    
    //3.create time
    UILabel *createTimeLabel = [[UILabel alloc]init];
    [self addSubview:createTimeLabel];
    [createTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userName.mas_bottom).offset(10);
        make.left.mas_equalTo(userName.mas_left);
    }];
    createTimeLabel.text = @"10月15日 16:41";
    createTimeLabel.font = [UIFont systemFontOfSize:13.0f];
    self.createTimeLabel = createTimeLabel;
    
    //4.至顶
    UIView *zhiDingView = [[UIView alloc]init];
    [self addSubview:zhiDingView];
    zhiDingView.backgroundColor = UIColor.brownColor;
    [zhiDingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(userName.mas_top);
        make.width.mas_equalTo(40);
    }];
    zhiDingView.backgroundColor = UIColor.blueColor;
    
    UILabel *zhiDingLabel = [[UILabel alloc]init];
    [zhiDingView addSubview:zhiDingLabel];
    [zhiDingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    zhiDingLabel.text = @"置顶";
    zhiDingLabel.textColor = [UIColor redColor];
    zhiDingLabel.font = [UIFont systemFontOfSize:13.0f];
    zhiDingLabel.backgroundColor = UIColor.brownColor;
    zhiDingLabel.textAlignment = NSTextAlignmentCenter;
    
    UIImageView *topIcon = [[UIImageView alloc]init];
    [zhiDingView addSubview:topIcon];
    [topIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(zhiDingLabel.mas_left);
        make.centerY.mas_equalTo(zhiDingLabel.mas_centerY);
        make.width.height.mas_equalTo(10);
        make.left.mas_equalTo(0);
    }];
    topIcon.backgroundColor = UIColor.yellowColor;
    
    self.zhiDingView = zhiDingView;
}

- (void)setDataList:(NSArray *)dataList{
    _dataList = dataList;
    BOOL isZhiDingViewExisted = true;
    __block int realCount = 20;
    
    
    UIView *medalView = [[UIView alloc]init];
    [self addSubview:medalView];
    medalView.backgroundColor = UIColor.greenColor;
    if (isZhiDingViewExisted) {
        [medalView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userName.mas_right).offset(5);
            make.top.mas_equalTo(self.userName.mas_top);
            make.bottom.mas_equalTo(self.userName.mas_bottom);
            make.right.mas_equalTo(self.zhiDingView.mas_left).offset(-5);
        }];
    }else{
        [medalView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userName.mas_right).offset(5);
            make.top.mas_equalTo(self.userName.mas_top);
            make.bottom.mas_equalTo(self.userName.mas_bottom);
            make.right.mas_equalTo(-5);
        }];
        self.zhiDingView.hidden = YES;
    }
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGRect iconFrame = self.icon.frame;
        CGRect nameLabelFrame = self.userName.frame;
        CGRect zhidingFrame = self.zhiDingView.frame;
        CGRect medalViewFrame = medalView.frame;
        CGFloat medalViewWidth = medalViewFrame.size.width;
        
        CGFloat medalItemWidth = 20;
        CGFloat marginItem = 5;
        int maxCount = (int)(medalViewWidth / (medalItemWidth+marginItem)*1.0f);
        
        //如果当前获得的奖章数大于最大值，取最大值即可
        if (realCount > maxCount) {
            realCount = maxCount;
        }
        
        for (int index=0; index<realCount; index++) {
            CGFloat widthHeight = 20;
            CGFloat marginX = 5.0f;
            CGFloat marginLeft = marginX*(index+1)+widthHeight*index;

            UIImageView *imgView = [[UIImageView alloc]init];
            [medalView addSubview:imgView];
            [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(marginLeft);
                make.top.mas_equalTo(0);
                make.width.mas_equalTo(widthHeight);
                make.height.mas_equalTo(widthHeight);
            }];
            imgView.backgroundColor = UIColor.purpleColor;
        }
    });
}

@end
