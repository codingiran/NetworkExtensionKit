//
//  NEVPNConnection+.h
//  AppleExtension
//
//  Created by iran.qiu on 2023/3/16.
//

#if __has_include(<NetworkExtension/NetworkExtension.h>)

#import <NetworkExtension/NetworkExtension.h>

NS_ASSUME_NONNULL_BEGIN

@interface NEVPNConnection (AppleExtension)

- (void)stopVPNWithCompletion:(void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END

#endif
