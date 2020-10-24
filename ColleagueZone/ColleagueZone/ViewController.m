//
//  ViewController.m
//  ColleagueZone
//
//  Created by Evan Yang on 2020/10/24.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

#import "ViewController.h"
#import "EcoColleagueZoneTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 300;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"CELL";
    EcoColleagueZoneTableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[EcoColleagueZoneTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.backgroundColor = UIColor.blueColor;
    return cell;
}

@end
