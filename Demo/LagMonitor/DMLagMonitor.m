//
//  DMLagMonitor.m
//  Demo
//
//  Created by liumenghua on 2021/3/19.
//

#import "DMLagMonitor.h"

@interface DMLagMonitor ()

@property (atomic, strong) dispatch_semaphore_t semaphore;
@property (atomic, assign) CFRunLoopObserverRef runloopObserver;
@property (nonatomic, assign) CFRunLoopActivity activity;   // runloop的状态
@property (nonatomic, assign) NSInteger timeoutCount;   // 卡顿超时次数

@end

@implementation DMLagMonitor

+ (instancetype)sharedInstance {
    static DMLagMonitor *_instance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        _instance = [[DMLagMonitor alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.semaphore = dispatch_semaphore_create(0);
        [self addObserver];
    }
    return self;
}

- (void)addObserver {
    // 创建observer 并添加到主线程runloop的CommonModes中
    CFRunLoopObserverContext context = {0, (__bridge void*)self, NULL, NULL};
    self.runloopObserver = CFRunLoopObserverCreate(kCFAllocatorDefault,
                                                   kCFRunLoopAllActivities,
                                                   YES,
                                                   0,
                                                   &runloopObserverCallBack,
                                                   &context);
    CFRunLoopAddObserver(CFRunLoopGetMain(), self.runloopObserver, kCFRunLoopCommonModes);
}


static void runloopObserverCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    DMLagMonitor *monitor = (__bridge DMLagMonitor*)info;
    
    // 记录 runloop 状态
    monitor.activity = activity;
    
    // runloop 状态变化后，发送信号，对信号量加 1
    dispatch_semaphore_t semaphore = monitor.semaphore;
    dispatch_semaphore_signal(semaphore);
}

- (void)startLagMonitor {
    // 子线程监控
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        while (YES) {
            long semaphoreWait = dispatch_semaphore_wait(self.semaphore, dispatch_time(DISPATCH_TIME_NOW, 20 * NSEC_PER_MSEC));
            if (semaphoreWait != 0) {
                CFRunLoopActivity activity = self.activity;
                if (activity == kCFRunLoopBeforeSources || activity == kCFRunLoopAfterWaiting) {
                    if (self.timeoutCount < 3) {
                        self.timeoutCount++;
                        continue;
                    }
                    
                    // 触发卡顿，获取堆栈
                    NSLog(@"发生卡顿====");
                }
            } else {
                self.timeoutCount = 0;
            }
        }
    });
}

- (void)stopLagMonitor {
    self.timeoutCount = 0;
    self.semaphore = dispatch_semaphore_create(0);
}


@end
