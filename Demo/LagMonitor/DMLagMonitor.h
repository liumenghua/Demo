//
//  DMLagMonitor.h
//  Demo
//
//  Created by liumenghua on 2021/3/19.
//  runloop + 信号量 实现卡顿监控

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DMLagMonitor : NSObject

+ (instancetype)sharedInstance;

- (void)startLagMonitor;
- (void)stopLagMonitor;

@end

NS_ASSUME_NONNULL_END
