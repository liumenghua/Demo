//
//  ViewController.m
//  Demo
//
//  Created by liumenghua on 2021/3/19.
//

#import "ViewController.h"
#import "MonitorTestViewController.h"
#import "TerminateViewController.h"
#import "KVOTestViewController.h"
#import "Demo-Bridging-Header.h"
#import "Demo-Swift.h" // 导入 Product-Swift.h 以访问swift文件

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)buttonAction:(id)sender {
    [self presentViewController:[[MonitorTestViewController alloc] init] animated:YES completion:nil];
}

- (IBAction)terminateButtonAction:(id)sender {
    [self presentViewController:[[TerminateViewController alloc] init] animated:YES completion:nil];
}

- (IBAction)kvoTestAction:(id)sender {
    [self presentViewController:[[KVOTestViewController alloc] init] animated:YES completion:nil];
}

- (IBAction)capsuleButton:(id)sender {
    [self presentViewController:[[CapsuleViewController alloc] init] animated:YES completion:nil];
}


@end
