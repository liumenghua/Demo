//
//  MonitorTestViewController.m
//  Demo
//
//  Created by liumenghua on 2021/3/19.
//

#import "MonitorTestViewController.h"

static NSString *const kDMCellReuseID = @"DMCellReuseIdentifier";

@interface MonitorTestViewController ()<UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;
@end

@implementation MonitorTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableview];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 200;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDMCellReuseID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 行", indexPath.row];
    
    // 卡顿测试
    if (indexPath.row % 10 == 0) {
        usleep(200 * 1000);
        cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 行 -- 卡顿测试", indexPath.row];
    }
    
    return cell;
}


- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableview.dataSource = self;
        _tableview.rowHeight = 100;
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"DMCellReuseIdentifier"];
    }
    return _tableview;
}

@end
