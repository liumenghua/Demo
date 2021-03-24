//
//  UserDataManager.h
//  Demo
//
//  Created by liumenghua on 2021/3/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDataManager : NSObject

+ (instancetype)sharedInstance;

- (void)addUserData:(NSDictionary *)dict;
- (NSString *)dataContentString;

@end

NS_ASSUME_NONNULL_END
