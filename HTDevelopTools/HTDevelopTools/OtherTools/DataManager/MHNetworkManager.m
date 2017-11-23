//
//  MHNetworkManager.m
//  MHProject
//
//  Created by yons on 15/9/22.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import "MHNetworkManager.h"
#import "MHAsiNetworkHandler.h"
#import "MHUploadParam.h"
#import "MBProgressHUD+Add.h"
#import "AFNetworking.h"
#import "NSData+HTDataImage.h"

@implementation MHNetworkManager
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static MHNetworkManager *_manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [super allocWithZone:zone];
    });
    return _manager;
}
/// 返回单例
+(instancetype)sharedInstance
{
    return [[super alloc] init];
}
#pragma mark - GET 请求的三种回调方法


/**
 GET请求的公共方法 一下三种方法都调用这个方法 根据传入的不同参数觉得回调的方式

 @param url url
 @param params 参数字典
 @param target target
 @param action action
 @param delegate 代理
 @param successBlock 请求成功的回调
 @param failureBlock 请求失败的回调
 @param toView showHUD
 */
+ (void)getRequstWithURL:(NSString*)url
                  params:(NSDictionary*)params
                  target:(id)target
                  action:(SEL)action
                delegate:(id)delegate
            successBlock:(MHAsiSuccessBlock)successBlock
            failureBlock:(MHAsiFailureBlock)failureBlock
                 showHUD:(UIView *)toView
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:params];
    [[MHAsiNetworkHandler sharedInstance] conURL:url networkType:MHAsiNetWorkGET params:mutableDict delegate:delegate showHUD:toView target:target action:action successBlock:successBlock failureBlock:failureBlock];
}
/**
 *   GET请求通过Block 回调结果
 *
 *   @param url          url
 *   @param params   paramsDict
 *   @param successBlock  成功的回调
 *   @param failureBlock  失败的回调
 *   @param toView      是否加载进度指示器
 */
+ (void)getRequstWithURL:(NSString*)url
                  params:(NSDictionary*)params
            successBlock:(MHAsiSuccessBlock)successBlock
            failureBlock:(MHAsiFailureBlock)failureBlock
                 showHUD:(UIView *)toView
{
    [self getRequstWithURL:url params:params target:nil action:nil delegate:nil successBlock:successBlock failureBlock:failureBlock showHUD:toView];
}
/**
 *   GET请求通过代理回调
 *
 *   @param url         url
 *   @param params  请求的参数
 *   @param delegate    delegate
 *   @param toView    是否转圈圈
 */
+ (void)getRequstWithURL:(NSString*)url
                  params:(NSDictionary*)params
                delegate:(id<MHAsiNetworkDelegate>)delegate
                 showHUD:(UIView *)toView
{
    [self getRequstWithURL:url params:params target:nil action:nil delegate:delegate successBlock:nil failureBlock:nil showHUD:toView];
}

/**
 *   get 请求通过 taget 回调方法
 *
 *   @param url         url
 *   @param params  请求参数的字典
 *   @param target      target
 *   @param action      action
 *   @param toView     是否加载进度指示器
 */
+ (void)getRequstWithURL:(NSString*)url
                  params:(NSDictionary*)params
                  target:(id)target
                  action:(SEL)action
                 showHUD:(UIView *)toView
{
    [self getRequstWithURL:url params:params target:target action:action delegate:nil successBlock:nil failureBlock:nil showHUD:toView];
}

#pragma mark - POST请求的三种回调方法
/**
 *   发送一个 POST请求的公共方法 传入不同的回调参数决定回调的方式
 *
 *   @param url           ur
 *   @param params   paramsDict
 *   @param target       target
 *   @param action       action
 *   @param delegate     delegate
 *   @param successBlock successBlock
 *   @param failureBlock failureBlock
 *   @param toView      showHUD
 */
+ (void)postReqeustWithURL:(NSString*)url
                    params:(NSDictionary*)params
                    target:(id)target
                    action:(SEL)action
                  delegate:(id<MHAsiNetworkDelegate>)delegate
              successBlock:(MHAsiSuccessBlock)successBlock
              failureBlock:(MHAsiFailureBlock)failureBlock
                   showHUD:(UIView *)toView
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:params];
    [[MHAsiNetworkHandler sharedInstance] conURL:url networkType:MHAsiNetWorkPOST params:mutableDict delegate:delegate showHUD:toView target:target action:action successBlock:successBlock failureBlock:failureBlock];
}
/**
 *   通过 Block回调结果
 *
 *   @param url           url
 *   @param params    请求的参数字典
 *   @param successBlock  成功的回调
 *   @param failureBlock  失败的回调
 *   @param toView       是否加载进度指示器
 */
+ (void)postReqeustWithURL:(NSString*)url
                    params:(NSDictionary*)params
              successBlock:(MHAsiSuccessBlock)successBlock
              failureBlock:(MHAsiFailureBlock)failureBlock
                   showHUD:(UIView *)toView
{
    [self postReqeustWithURL:url params:params target:nil action:nil delegate:nil successBlock:successBlock failureBlock:failureBlock showHUD:toView];
}
/**
 *   post请求通过代理回调
 *
 *   @param url         url
 *   @param params  请求的参数
 *   @param delegate    delegate
 *   @param toView    是否转圈圈
 */
+ (void)postReqeustWithURL:(NSString*)url
                    params:(NSDictionary*)params
                  delegate:(id<MHAsiNetworkDelegate>)delegate
                   showHUD:(UIView *)toView;
{
    [self postReqeustWithURL:url params:params target:nil action:nil delegate:delegate successBlock:nil failureBlock:nil showHUD:toView];
}
/**
 *   post 请求通过 target 回调结果
 *
 *   @param url         url
 *   @param params  请求参数的字典
 *   @param target      target
 *   @param toView     是否显示圈圈
 */
+ (void)postReqeustWithURL:(NSString*)url
                    params:(NSDictionary*)params
                    target:(id)target
                    action:(SEL)action
                   showHUD:(UIView *)toView
{
    [self postReqeustWithURL:url params:params target:target action:action delegate:nil successBlock:nil failureBlock:nil showHUD:toView];
}

//上传多张图片
+ (void)uploadFileWithURL:(NSString*)url
                   params:(NSDictionary*)paramsDict
             successBlock:(MHAsiSuccessBlock)successBlock
             failureBlock:(MHAsiFailureBlock)failureBlock
         uploadParamArray:(NSArray *)uploadParamArray
                imageName:(NSString *)imagesName
                  showHUD:(UIView *)toView

{
    if (toView) {
        
        [MBProgressHUD showHUDAddedTo:toView animated:YES];
    }
    NSLog(@"上传图片接口 URL-> %@",url);
    NSLog(@"上传图片的参数-> %@",paramsDict);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:paramsDict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (uploadParamArray.count > 0) {
            
            for (NSInteger i = 0; i < uploadParamArray.count; i++) {
                
                UIImage *image = uploadParamArray[i];
                
                NSData *picData = [NSData ht_dataWithImage:image];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"yyyyMMddHHmmss";
                NSString *fileNmae = [NSString stringWithFormat:@"%@%ld.png",[formatter stringFromDate:[NSDate date]],(long)i];
                [formData appendPartWithFileData:picData name:imagesName fileName:fileNmae mimeType:@"image/png"];
            }

        }
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [MBProgressHUD hideHUDForView:toView animated:YES];
        NSLog(@"----> %@",responseObject);
        if (successBlock) {
            successBlock(responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideAllHUDsForView:toView animated:YES];
        
        DTLog(@"----> %@",error.domain);
        if (error) {
            
            failureBlock(error);
        }
        
    }];
    
}



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
                  showHUD:(UIView *)toView
{
    if (toView) {
        
        [MBProgressHUD showHUDAddedTo:nil animated:YES];
    }
    DTLog(@"上传图片接口 URL-> %@",url);
    DTLog(@"上传图片的参数-> %@",paramsDict);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:uploadParam.data constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.fileName mimeType:uploadParam.mimeType];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [MBProgressHUD hideHUDForView:nil animated:YES];
        DTLog(@"----> %@",responseObject);
        if (successBlock) {
            successBlock(responseObject);
        }


    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideAllHUDsForView:nil animated:YES];
        DTLog(@"----> %@",error.domain);
        if (error) {
            
            failureBlock(error);
        }

    }];
    
}
@end
