//
//  NEVPNConnection+.m
//  AppleExtension
//
//  Created by iran.qiu on 2023/3/16.
//

#if __has_include(<NetworkExtension/NetworkExtension.h>)

#import "include/NEVPNConnection+.h"
#import <objc/runtime.h>

@interface NEVPNConnection ()

@property(nonatomic, copy) void (^stopCompletion)(void);

@end

@implementation NEVPNConnection (AppleExtension)

static char kAssociatedObjectKey_stopCompletion;

- (void)setStopCompletion:(void (^)(void))stopCompletion
{
    objc_setAssociatedObject(self, &kAssociatedObjectKey_stopCompletion, stopCompletion, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))stopCompletion
{
    return objc_getAssociatedObject(self, &kAssociatedObjectKey_stopCompletion);;
}

- (void)stopVPNWithCompletion:(void (^)(void))completion
{
    self.stopCompletion = completion;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleVPNStatusDidChangeNotification:) name:NEVPNStatusDidChangeNotification object:self];
    [self stopVPNTunnel];
}

- (void)handleVPNStatusDidChangeNotification:(NSNotification *)notification
{
    NEVPNStatus status = self.manager.connection.status;
    switch (status) {
        case NEVPNStatusDisconnected:
        {
            if (self.stopCompletion != nil) {
                self.stopCompletion();
                self.stopCompletion = nil;
                [[NSNotificationCenter defaultCenter] removeObserver:self name:NEVPNStatusDidChangeNotification object:self];
            }
        }
            break;
        default:
            break;
    }
}

@end

#endif
