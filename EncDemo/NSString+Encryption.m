//
//  NSString+Encryption.m
//  EncDemo
//
//  Created by abyzhou on 2020/9/11.
//  Copyright © 2020 abyzhou. All rights reserved.
//

#import "NSString+Encryption.h"

static int ENCRYPT_VAL[32] =  {
    65, 65, 53, 68, 54, 52, 69, 48,
    68, 54, 65, 52, 68, 69, 49, 51,
    65, 70, 50, 48, 70, 55, 53, 48,
    52, 69, 56, 56, 57, 57, 56, 69
};

@implementation NSString (Encryption)

// 异或加密
- (NSString *)xorencrypt
{
    if (self.length == 0) return nil;

    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];

    const char *chrString = [self UTF8String];
    char chrs[data.length];
    strcpy(chrs, chrString);
    size_t count = sizeof(ENCRYPT_VAL);

    NSMutableData *encryptMutableData = [[NSMutableData alloc] initWithCapacity:data.length];

    for (int i = 0; i < data.length; i++) {
        Byte b = (Byte)((chrs[i]) ^ ENCRYPT_VAL[i % count]);
        [encryptMutableData appendBytes:&b length:1];
    }

    NSString *result = [encryptMutableData base64EncodedStringWithOptions:0];

    return result;
}

- (NSString *)dxorencrypt
{
    if (self.length == 0) return nil;
    NSData *base64String = [[NSData alloc] initWithBase64EncodedString:self options:0];
    NSString *base64Decoded = [[NSString alloc] initWithData:base64String encoding:NSUTF8StringEncoding];
    const char *chrString = [base64Decoded UTF8String];
    char chrs[base64String.length];
    strcpy(chrs, chrString);
    size_t count = sizeof(ENCRYPT_VAL);

    NSMutableData *decMutableData = [[NSMutableData alloc] initWithCapacity:base64String.length];

    for (int i = 0; i < base64String.length; i++) {
        Byte by;
        [base64String getBytes:&by range:NSMakeRange(i, 1)];
        by = (Byte)(by ^ ENCRYPT_VAL[i % count]);
        [decMutableData appendBytes:&by length:1];
    }
    return [[NSString alloc] initWithData:decMutableData encoding:NSUTF8StringEncoding];
}

@end
