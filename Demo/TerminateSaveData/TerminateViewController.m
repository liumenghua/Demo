//
//  TerminateViewController.m
//  Demo
//
//  Created by liumenghua on 2021/3/24.
//

#import "TerminateViewController.h"
#import "UserDataManager.h"

@interface TerminateViewController ()

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation TerminateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 200)];
    contentLabel.numberOfLines = 0;
    contentLabel.textColor = [UIColor blackColor];
    contentLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    contentLabel.layer.borderWidth = 1.f;
    [self.view addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(self.view.bounds.size.width / 2.0 - 50, 400, 100, 50);
    [button setTitle:@"显示上一次的数据" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(printData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSDictionary *dict = @{@"action": @"push", @"from": @"home"};
    [[UserDataManager sharedInstance] addUserData:dict];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSDictionary *dict = @{@"action": @"pop", @"from": @"topic"};
    [[UserDataManager sharedInstance] addUserData:dict];
}

- (void)printData {
    NSString *content = [[UserDataManager sharedInstance] dataContentString];
    self.contentLabel.text = content;
}





@end
