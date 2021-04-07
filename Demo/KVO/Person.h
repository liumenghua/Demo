//
//  Person.h
//  Demo
//
//  Created by liumenghua on 2021/4/6.
//

#import <Foundation/Foundation.h>
#import "Account.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, strong) Account *account1;
@property (nonatomic, strong) Account *account2;

@end

NS_ASSUME_NONNULL_END
