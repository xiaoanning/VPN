//
//  VPNConnection.m
//  VPN
//
//  Created by 安宁 on 2017/5/31.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import "VPNConnection.h"
#import <ifaddrs.h>

@implementation VPNConnection


+ (BOOL)isVPNConnected
{
    
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr  = NULL;
    
    // retrieve the current interfaces - returns 0 on success
    int success = 0;
    
    success = getifaddrs(&interfaces);
    
    if (success == 0)
    {
        // Loop through linked list of interfaces
        
        temp_addr = interfaces;
        
        while (temp_addr != NULL)
        {
            
            NSString *string = [NSString stringWithFormat:@"%s" , temp_addr->ifa_name];
            
            if ([string rangeOfString:@"tap"].location != NSNotFound ||
                
                [string rangeOfString:@"tun"].location != NSNotFound ||
                
                [string rangeOfString:@"ppp"].location != NSNotFound)
            {
                
                return YES;
                
            }
            
            temp_addr = temp_addr->ifa_next;
            
        }
        
    }
    
    // Free memory
    freeifaddrs(interfaces);
    
    return NO;
    
}
@end
