//
//  MTMKNetRequest.h
//  yimouleng
//
//  Created by Ely on 15-10-13.
//  Copyright (c) 2015年 yimouleng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKNetworkKit.h"

typedef void(^CompletionLoad)(id result);

@interface MTMKNetRequest : NSObject

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

+ (MKNetworkEngine *)requestGETWithHostName:(NSString *)hostName
                                 apiPath:(NSString *)apiPath
                             headerField:(NSDictionary *)header
                               URLString:(NSString *)URLString
                                  params:(NSDictionary *)params
                              httpMethod:(NSString *)httpMethod
                                     ssl:(BOOL)isBOOL
                                   block:(CompletionLoad)block;
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
                                   block:(CompletionLoad)block;

@end
