//
//  HTBaseRequest.m
//  ArchDemo
//
//  Created by 方永清 on 16/03/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import "HTBaseRequest.h"

#define PROTOCOL_URL          @"http://Api.kai-men.cn"        //生产环境


@interface HTBaseRequest() <YTKRequestDelegate>
{
    id<HTNetworkDelegate> _netDelegate;
}

@end


@implementation HTBaseRequest

- (NSString *)baseUrl {
    return PROTOCOL_URL;
}

- (void)startWithDelegate:(id<HTNetworkDelegate>)delegate
{
    _netDelegate = delegate;
    
    self.delegate = self;
    [self start];
}

#pragma YTKRequestDelegate

- (void)requestFinished:(YTKBaseRequest *)request
{
    NSLog(@"requestUrl====%@",request.requestUrl);
    
    NSDictionary *json = [request responseJSONObject];
    
    if (json && [json isKindOfClass:[NSDictionary class]])
    {
        NSInteger ret = [json[@"ret"] integerValue];
        if (ret == 0)
        {
            [_netDelegate onRequestFinish:request data:json[@"data"]];
        }
        else
        {
            [_netDelegate onRequestFail:request errMsg:@"error"];
        }
    }
    else
    {
        [_netDelegate onRequestFail:request errMsg:@"response nil"];
    }
    _netDelegate = nil;
}

- (void)requestFailed:(YTKBaseRequest *)request
{
     [_netDelegate onRequestFail:request errMsg:@"response error"];
    
    _netDelegate = nil;
}


@end
