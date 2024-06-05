//
//  KernControlDefine.h
//  AppleExtension
//
//  Created by iran.qiu on 2023/3/16.
//

#import <Foundation/Foundation.h>

/* From <sys/kern_control.h> */
#define CTLIOCGINFO 0xc0644e03UL

#if TARGET_OS_IOS

struct ctl_info {
    u_int32_t   ctl_id;
    char        ctl_name[96];
};
struct sockaddr_ctl {
    u_char      sc_len;
    u_char      sc_family;
    u_int16_t   ss_sysaddr;
    u_int32_t   sc_id;
    u_int32_t   sc_unit;
    u_int32_t   sc_reserved[5];
};

#endif
