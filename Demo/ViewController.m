//
//  ViewController.m
//  Demo
//
//  Created by liumenghua on 2021/3/19.
//

#import "ViewController.h"
#import "MonitorTestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)buttonAction:(id)sender {
    [self presentViewController:[[MonitorTestViewController alloc] init] animated:YES completion:nil];
}

@end
