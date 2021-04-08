//
//  Account+Custom.m
//  Demo
//
//  Created by liumenghua on 2021/4/7.
//

#import "Account+Custom.h"
#import <objc/runtime.h>

@implementation Account (Custom)

- (NSString *)accountName {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAccountName:(NSString *)accountName {
    objc_setAssociatedObject(self, @selector(accountName), accountName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
