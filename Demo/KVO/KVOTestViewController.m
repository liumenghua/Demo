//
//  KVOTestViewController.m
//  Demo
//
//  Created by liumenghua on 2021/4/6.
//

#import "KVOTestViewController.h"
#import "Person.h"

@interface KVOTestViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation KVOTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.person = [[Person alloc] init];
    self.person.account1.balance = 5.0;
    self.person.account1.accountName = @"account1";
    self.person.account2.balance = 5.0;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.person.account1 setBalance:10.0];
    [self.person.account1 setAccountName:@"new_account1"];
    [self.person.account2 setBalance:10.0];
}


@end
