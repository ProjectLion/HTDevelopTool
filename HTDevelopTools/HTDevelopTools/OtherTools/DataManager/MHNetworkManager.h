//
//  MHNetworkManager.h
//  MHProject
//
//  Created by yons on 15/9/22.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MHAsiNetworkDefine.h"
#import "MHAsiNetworkDelegate.h"
@class MHUploadParam;
/// 请求管理着
@interface MHNetworkManager : NSObject

/// 返回单例
+(instancetype)sharedInstance;

#pragma mark - 发送 GET 请求的方法


/**
 GET请求通过Block 回调结果

 @param url url
 @param paramsDict 参数字典
 @param successBlock 请求成功的回调
 @param failureBlock 请求失败的回调
 @param toView 展示加载进度指示器的视图
 */
+ (void)getRequstWithURL:(NSString*)url
                  params:(NSDictionary*)paramsDict
            successBlock:(MHAsiSuccessBlock)successBlock
            failureBlock:(MHAsiFailureBlock)failureBlock
                 showHUD:(UIView *)toView;

/**
 GET请求通过代理回调

 @param url url
 @param paramsDict 参数字典
 @param delegate 代理
 @param toView 展示加载进度指示器的视图
 */
+ (void)getRequstWithURL:(NSString*)url
                  params:(NSDictionary*)paramsDict
                delegate:(id<MHAsiNetworkDelegate>)delegate
                 showHUD:(UIView *)toView;
/**
 *   get 请求通过 taget 回调方法
 *
 *   @param url         url
 *   @param paramsDict  请求参数的字典
 *   @param target      target
 *   @param action      action
 *   @param toView     是否加载进度指示器
 */
+ (void)getRequstWithURL:(NSString*)url
                  params:(NSDictionary*)paramsDict
                  target:(id)target
                  action:(SEL)action
                 showHUD:(UIView *)toView;

#pragma mark - 发送 POST 请求的方法
/**
 *   通过 Block回调结果
 *
 *   @param url           url
 *   @param paramsDict    请求的参数字典
 *   @param successBlock  成功的回调
 *   @param failureBlock  失败的回调
 *   @param toView       是否加载进度指示器
 */
+ (void)postReqeustWithURL:(NSString*)url
                    params:(NSDictionary*)paramsDict
              successBlock:(MHAsiSuccessBlock)successBlock
              failureBlock:(MHAsiFailureBlock)failureBlock
                   showHUD:(UIView *)toView;
/**
 *   post请求通过代理回调
 *
 *   @param url         url
 *   @param paramsDict  请求的参数
 *   @param delegate    delegate
 *   @param toView    是否转圈圈
 */
+ (void)postReqeustWithURL:(NSString*)url
                    params:(NSDictionary*)paramsDict
                  delegate:(id<MHAsiNetworkDelegate>)delegate
                   showHUD:(UIView *)toView;
/**
 *   post 请求通过 target 回调结果
 *
 *   @param url         url
 *   @param paramsDict  请求参数的字典
 *   @param target      target
 *   @param toView     是否显示圈圈
 */
+ (void)postReqeustWithURL:(NSString*)url
                    params:(NSDictionary*)paramsDict
                    target:(id)target
                    action:(SEL)action
                   showHUD:(UIView *)toView;
/**
 *  上传文件
 *
 *  @param url          上传文件的 url 地址
 *  @param paramsDict   参数字典
 *  @param successBlock 成功
 *  @param failureBlock 失败
 *  @param toView      显示 HUD
 */
+ (void)uploadFileWithURL:(NSString*)url
                   params:(NSDictionary*)paramsDict
             successBlock:(MHAsiSuccessBlock)successBlock
             failureBlock:(MHAsiFailureBlock)failureBlock
              uploadParam:(MHUploadParam *)uploadParam
                  showHUD:(UIView *)toView;


/**
 *  上传多张图片
 *
 *  @param url              上传图片的 url 地址
 *  @param paramsDict       参数字典
 *  @param successBlock     成功
 *  @param failureBlock     失败
 *  @param uploadParamArray 字典数组
 *  @param imagesName       图片名称
 *  @param toView          显示 HUD
 */
+ (void)uploadFileWithURL:(NSString*)url
                   params:(NSDictionary*)paramsDict
             successBlock:(MHAsiSuccessBlock)successBlock
             failureBlock:(MHAsiFailureBlock)failureBlock
         uploadParamArray:(NSArray *)uploadParamArray
                imageName:(NSString *)imagesName
                  showHUD:(UIView *)toView;
@end
