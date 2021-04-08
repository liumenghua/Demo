//
//  Person.m
//  Demo
//
//  Created by liumenghua on 2021/4/6.
//

#import "Person.h"
#import <objc/runtime.h>

static void *PersonAccountBalanceContext = &PersonAccountBalanceContext;
static void *PersonAccountNameContext = &PersonAccountNameContext;

@implementation Person

- (instancetype)init {
    self = [super init];
    if (self) {
        self.account1 = [[Account alloc] init];
        self.account2 = [[Account alloc] init];
        
        NSLog(@"account1添加KVO监听之前的类名 - %@", object_getClass(self.account1));
        
        [self.account1 addObserver:self
                       forKeyPath:@"balance"
                          options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
                          context:PersonAccountBalanceContext];
        
        // MARK: 关联对象也能添加KVO监听
        [self.account1 addObserver:self
                       forKeyPath:@"accountName"
                          options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
                          context:PersonAccountNameContext];
        
        NSLog(@"account1添加KVO监听之后的类名 - %@", object_getClass(self.account1));
        
    }
    return self;
}

- (void)dealloc {
    [self.account1 removeObserver:self forKeyPath:@"balance"];
    [self.account1 removeObserver:self forKeyPath:@"accountName"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context == PersonAccountBalanceContext) {
        // balance 发生改变
        NSLog(@"旧的balance:%f， 新的balance:%f", [[change objectForKey:NSKeyValueChangeOldKey] floatValue],  [[change objectForKey:NSKeyValueChangeNewKey] floatValue]);
    } else if (context == PersonAccountNameContext) {
        // accountName 发生改变
        NSLog(@"旧的accountName:%@， 新的accountName:%@", [change objectForKey:NSKeyValueChangeOldKey],  [change objectForKey:NSKeyValueChangeNewKey]);
    } else {
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}


@end
