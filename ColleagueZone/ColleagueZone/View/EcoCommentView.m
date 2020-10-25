//
//  EcoCommentView.m
//  ColleagueZone
//
//  Created by Evan Yang on 2020/10/25.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

#import "EcoCommentView.h"
#import "MLLinkLabel.h"

@interface EcoCommentView()<MLLinkLabelDelegate>

@property(nonatomic,strong)NSArray *commentItemsArray;

@end

@implementation EcoCommentView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

-(void)setupSubviews{
    NSString *str = @"zhe.zhang(张吉) : 三十而厉112你好的方式豆腐豆腐加料酒 大风大浪肌肤放多放辣椒 放到家里发生了 反对浪费精神";
    MLLinkLabel *label = [[MLLinkLabel alloc]init];
    [self addSubview:label];
    label.numberOfLines = 0;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    label.text = str;
    label.linkTextAttributes = @{NSForegroundColorAttributeName:UIColor.blueColor};
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:str];
    [attrStr setAttributes:@{NSLinkAttributeName:@"zhe.zhang(张吉)"} range:[str rangeOfString:@"zhe.zhang(张吉)"]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClicked:)];
    [label addGestureRecognizer:tap];
    
    label.attributedText = attrStr;
    label.delegate = self;
}

- (void)didClickLink:(MLLink*)link linkText:(NSString*)linkText linkLabel:(MLLinkLabel*)linkLabel{
    NSLog(@"linkText---%@",linkText);
    NSLog(@"text is %@",linkLabel.text);
}

- (void)tapClicked:(UITapGestureRecognizer *)tap{
    NSLog(@"tapClicked");
}

@end
