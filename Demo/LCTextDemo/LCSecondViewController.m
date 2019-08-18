//
//  LCSecondViewController.m
//  LCTextDemo
//
//  Created by xmly on 2019/8/14.
//  Copyright © 2019 mengLingChao. All rights reserved.
//

#import "LCSecondViewController.h"
#import "Masonry.h"

@interface LCSecondViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *classNames;//

@end

@implementation LCSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self tableView];
}
#pragma mark - Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.mas_topLayoutGuideBottom);
        }];
    }
    return _tableView;
}
- (NSArray *)classNames {
    if (! _classNames) {
        _classNames = @[@"LCATableViewCell",@"LCBTableViewCell",@"LCCTableViewCell",@"LCDTableViewCell"];
    }
    return _classNames;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.classNames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @(indexPath.row).stringValue;
    NSString *className = self.classNames[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        Class class = NSClassFromString(className);
        cell = [[class alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    
    return cell;
}

@end
