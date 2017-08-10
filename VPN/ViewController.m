//
//  ViewController.m
//  VPN
//
//  Created by 安宁 on 2017/5/31.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import "ViewController.h"
#import "VPNConnection.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSLog(@" %d",[VPNConnection isVPNConnected]);
    
    
    
    NSURLSession * session = [NSURLSession sharedSession];
    NSString * str =  @"https://hyzx.hzbank.com.cn:444/HzBankOnlineServer/service/version/queryVersionInfo.do" ;
//    NSString * str = @"http://158.58.15.244:8080/corporBankMB/service/version/queryVersionInfo.do?platform=iPhone" ;
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    
    NSURLSessionTask * task =  [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"=== %@",  [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding] );
        
    }];
    
    [task resume];

}




@end
