//
//  MHAsiNetworkItem.m
//  MHProject
//
//  Created by MengHuan on 15/4/23.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import "MHAsiNetworkItem.h"
#import "AFNetworking.h"
#import "MBProgressHUD+Add.h"
#import "MHAsiNetworkDefine.h"

@interface MHAsiNetworkItem ()


@end

@implementation MHAsiNetworkItem


#pragma mark - 创建一个网络请求项，开始请求网络
/**
 *  创建一个网络请求项，开始请求网络
 *
 *  @param networkType  网络请求方式
 *  @param url          网络请求URL
 *  @param params       网络请求参数
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param hashValue    网络请求的委托delegate的唯一标示
 *  @param showHUD      是否显示HUD
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return MHAsiNetworkItem对象
 */
- (MHAsiNetworkItem *)initWithtype:(MHAsiNetWorkType)networkType
                               url:(NSString *)url
                            params:(NSDictionary *)params
                          delegate:(id)delegate
                            target:(id)target
                            action:(SEL)action
                         hashValue:(NSUInteger)hashValue
                           showHUD:(UIView *)toView
                      successBlock:(MHAsiSuccessBlock)successBlock
                      failureBlock:(MHAsiFailureBlock)failureBlock
{
    if (self = [super init])
    {
        self.networkType    = networkType;
        self.url            = url;
        self.params         = params;
        self.delegate       = delegate;
        self.toView        = toView;
        self.tagrget        = target;
        self.select         = action;
        
        //加载请求等待指示器
        if (toView) {
            
            [MBProgressHUD showHUDAddedTo:toView animated:YES];
        }
        __weak typeof(self)weakSelf = self;
        DTLog(@"--请求url地址--%@\n",url);
        DTLog(@"----请求参数%@\n",params);
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        //        manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObject:@"text/html"];
        
        //设置响应格式
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/html", nil];
        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.timeoutInterval = 10.0f;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
        //        AFJSONResponseSerializer *jsonSer =(AFJSONResponseSerializer*) manager.responseSerializer;
        //        jsonSer.removesKeysWithNullValues = YES;
        //        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        if (networkType==MHAsiNetWorkGET) //get请求
        {
            [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [MBProgressHUD hideAllHUDsForView:toView animated:YES];
                DTLog(@"\n\n请求url%@----请求的返回结果 %@\n",url,responseObject);
                
                if (successBlock) {
                    successBlock(responseObject);
                }
                
                if ([weakSelf.delegate respondsToSelector:@selector(requestDidFinishLoading:)]) {
                    [weakSelf.delegate requestDidFinishLoading:responseObject];
                }
                
                [weakSelf performSelector:@selector(finishedRequest: didFaild:) withObject:responseObject withObject:nil];
                [weakSelf removewItem];
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                [MBProgressHUD hideAllHUDsForView:toView animated:YES];
                DTLog(@"---error==%@\n",error.localizedDescription);
                
                if (failureBlock) {
                    
                    failureBlock(error);
                }
                if ([weakSelf.delegate respondsToSelector:@selector(requestdidFailWithError:)]) {
                    [weakSelf.delegate requestdidFailWithError:error];
                }
                [weakSelf performSelector:@selector(finishedRequest: didFaild:) withObject:nil withObject:error];
                [weakSelf removewItem];

            }];
            
        }else{ //post请求
            
            [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                [MBProgressHUD hideHUDForView:toView animated:YES];
                DTLog(@"\n\n请求url%@----请求的返回结果 %@\n",url,responseObject);
                NSLog(@"请求返回信息msg = %@",responseObject[@"msg"]);
                

                /*********处理请求成功后的数据问题***********/
                    if (successBlock) {//block回调
                        successBlock(responseObject);
                        
                    }
                    if ([weakSelf.delegate respondsToSelector:@selector(requestDidFinishLoading:)]) {//代理回调
                        [weakSelf.delegate requestDidFinishLoading:responseObject];
                    }
                    //SEL回调
                    [weakSelf performSelector:@selector(finishedRequest: didFaild:) withObject:responseObject withObject:nil];
                
                if ([responseObject[@"result"] isEqual:@1]) {
                    
                    DTLog(@"请求成功");

                    
                }else {
                    
                    if (responseObject[@"msg"]) {
                        
//                        [MBProgressHUD showSuccess:responseObject[@"msg"] toView:toView];
                    }
                }
                
                
                [weakSelf removewItem];
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                [MBProgressHUD hideHUDForView:toView animated:YES];
                if (error.code == -1001) {
                    
                    [MBProgressHUD showError:@"网络请求超时" toView:toView];
                }else {
                    
                    [MBProgressHUD showError:@"请求失败" toView:toView];
                }
                
                DTLog(@"---error==%@code=%ld\n",error.localizedDescription,error.code);
                if (failureBlock) {
                    failureBlock(error);
                }
                if ([weakSelf.delegate respondsToSelector:@selector(requestdidFailWithError:)]) {
                    [weakSelf.delegate requestdidFailWithError:error];
                }
                
                [weakSelf performSelector:@selector(finishedRequest: didFaild:) withObject:nil withObject:error];
                [weakSelf removewItem];
            }];
            
        }
    }
    return self;
}

/**
 *   移除网络请求项
 */
- (void)removewItem
{
    __weak typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([weakSelf.delegate respondsToSelector:@selector(netWorkWillDealloc:)]) {
            [weakSelf.delegate netWorkWillDealloc:weakSelf];
        }
    });
}

- (void)finishedRequest:(id)data didFaild:(NSError*)error
{
    if ([self.tagrget respondsToSelector:self.select]) {
        [self.tagrget performSelector:@selector(finishedRequest:didFaild:) withObject:data withObject:error];
    }
}

- (void)dealloc
{
    
    
}

@end
