//
//  MTMKNetRequest.m
//  yimouleng
//
//  Created by Ely on 15-10-13.
//  Copyright (c) 2015年 yimouleng. All rights reserved.
//

#import "MTMKNetRequest.h"

@implementation MTMKNetRequest
/**
 *             GET请求
 *
 *HostName     域名
 *portNumber   端口号
 *apiPath      API路径
 *headerField  请求头
 *URLString    URL
 *params       请求参数
 *httpMethod   请求方式
 *ssl          是否请求加密
 *block        回调
 */
+ (MKNetworkEngine *)requestGetWithHostName:(NSString *)hostName
                                 apiPath:(NSString *)apiPath
                             headerField:(NSDictionary *)header
                               URLString:(NSString *)URLString
                                  params:(NSDictionary *)params
                              httpMethod:(NSString *)httpMethod
                                     ssl:(BOOL)isBOOL
                                   block:(CompletionLoad)block
{
    /**
     *如果路径中包含中文，则需要转成专门用于URL的编码格式格式，有些服务器的编码可能有所不同 ----很重要------
     */ 
    URLString = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:hostName apiPath:apiPath customHeaderFields:header];
    
    MKNetworkOperation *operation = [engine operationWithPath:URLString params:params httpMethod:@"GET" ssl:isBOOL];
    //处理数据
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (block != nil) {
            block([completedOperation responseData]);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"Error:%@",completedOperation.error);
        if (block == nil) {
            block(error);
        }
    }];
    //发送请求
    [engine enqueueOperation:operation];
    
    return engine;
}


/**
 *             POST请求
 *
 *HostName     域名
 *portNumber   端口号
 *apiPath      API路径
 *headerField  请求头
 *URLString    URL
 *params       请求参数
 *httpMethod   请求方式
 *ssl          是否请求加密
 *block        回调
 */
+ (MKNetworkEngine *)requestPOSTWithHostName:(NSString *)hostName
                                    apiPath:(NSString *)apiPath
                                headerField:(NSDictionary *)header
                                  URLString:(NSString *)URLString
                                     params:(NSDictionary *)params
                                 httpMethod:(NSString *)httpMethod
                                        ssl:(BOOL)isBOOL
                                      block:(CompletionLoad)block
{
    /**
     *如果路径中包含中文，则需要转成专门用于URL的编码格式格式，有些服务器的编码可能有所不同 ----很重要------
     */
    URLString = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:hostName apiPath:apiPath customHeaderFields:header];
    
    MKNetworkOperation *operation = [engine operationWithPath:URLString params:params httpMethod:@"POST" ssl:isBOOL];
    //处理数据
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (block != nil) {
            block([completedOperation responseData]);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"Error:%@",completedOperation.error);
        if (block == nil) {
            block(error);
        }
    }];
    //发送请求
    [engine enqueueOperation:operation];
    
    return engine;
}
@end
