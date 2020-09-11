//
//  NSString+Encryption.h
//  EncDemo
//
//  Created by abyzhou on 2020/9/11.
//  Copyright © 2020 abyzhou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Encryption)

// 异或加密
- (NSString *)xorencrypt;
- (NSString *)dxorencrypt;

@end

NS_ASSUME_NONNULL_END
