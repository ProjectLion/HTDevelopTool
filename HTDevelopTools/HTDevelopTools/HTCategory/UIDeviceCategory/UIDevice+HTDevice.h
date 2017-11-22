//
//  UIDevice+HTDevice.h
//  HT
//
//  Created by HT on 2017/11/22.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger{
    HTNetWorkState_NoNetWork = 0,   //无网络
    HTNetWorkState_WiFi,            //WiFi
    HTNetWorkState_GPRS,            //GPRS
    HTNetWorkState_2G,              //2G网
    HTNetWorkState_3G,              //3G网
    HTNetWorkState_HRPD,            //HRPD
    HTNetWorkState_4G               //4G
}HTNetWorkState;

@interface UIDevice (HTDevice)

/**
 获取设备型号

 @return 型号
 */
+ (NSString *)ht_getDeviceModel;

/**
 获取设备系统版本号

 @return 版本号
 */
+ (NSString *)ht_getSystemVersion;

/**
 获取设备电池电量

 @return 电量
 */
+ (float)ht_getDeviceBatteryPower;

/**
 获取电池状态 0 (未知)、 1 (未充电)、2 (充电中)、3 (充满)

 @return 状态    UIDeviceBatteryStateUnknown,     0 (未知)
                UIDeviceBatteryStateUnplugged,   1 (未充电)
                UIDeviceBatteryStateCharging,    2 (充电中)
                UIDeviceBatteryStateFull,        3 (充满)
 */
+ (NSInteger)ht_getDeviceBatteryState;

/**
 获取设备名字

 @return 名字
 */
+ (NSString *)ht_getDeviceName;

/**
 获取设备当前网络状态 0(无网络)、1(WiFi)、2(GPRS)、3(2G网络)、4(3G网络)、5(HRPD)、6(4G网络)
 
 @return 网络状态
 */
+ (HTNetWorkState)ht_getDeviceNetWorkState;


@end
