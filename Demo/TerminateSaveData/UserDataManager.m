//
//  UserDataManager.m
//  Demo
//
//  Created by liumenghua on 2021/3/24.
//

#import "UserDataManager.h"
#import <UIKit/UIKit.h>

@interface UserDataManager ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation UserDataManager

+ (instancetype)sharedInstance {
    static UserDataManager *_instance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        _instance = [[UserDataManager alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dataArray = [NSMutableArray array];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(writeDataToLocal)
                                                     name:UIApplicationWillTerminateNotification
                                                   object:nil];
    }
    return self;
}

- (void)addUserData:(NSDictionary *)dict {
    [self.dataArray addObject:dict];
}

- (NSString *)dataContentString {
    NSArray *datas = [[NSUserDefaults standardUserDefaults] objectForKey:@"kUserViewData"];
    NSMutableString *content = [NSMutableString string];
    [content appendFormat:@"total: %d\n", datas.count];
    for (int i = 0; i < datas.count; i++) {
        NSDictionary *dict = datas[i];
        NSString *action = [dict objectForKey:@"action"];
        NSString *from = [dict objectForKey:@"from"];
        
        [content appendFormat:@"%d: action:%@, from:%@\n", i, action, from];
    }
    return [content copy];
}

- (void)writeDataToLocal {
    usleep(1000 * 1000); // 模拟kill app前保存大量数据
    [[NSUserDefaults standardUserDefaults] setObject:[self.dataArray copy] forKey:@"kUserViewData"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.dataArray removeAllObjects];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
