//
//  ArchBaseRequest.m
//  ArchDemo
//
//  Created by 方永清 on 08/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import "ArchBaseRequest.h"

#define PROTOCOL_URL          @"http://Api.kai-men.cn"        //生产环境
#define DOUBAN_URL            @"https://api.douban.com"
@implementation ArchBaseRequest

- (NSString *)baseUrl {
    return DOUBAN_URL;
}

#pragma 接收穿过来的block
-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 withErrorBlock: (ErrorCodeBlock) errorBlock
               withFailureBlock: (FailureBlock) failureBlock
{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}

- (void)sendRequest
{
    [self startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        // 你可以直接在这里使用 self
        NSLog(@"requestUrl====%@",request.requestUrl);
        NSLog(@"requestArgument====%@",request.requestArgument);

        NSDictionary *json = [request responseJSONObject];
        
        if (json && [json isKindOfClass:[NSDictionary class]]) {
            NSInteger ret = [json[@"ret"] integerValue];
            if (ret == 0) {
                self.returnBlock(json[@"data"]);
            } else {
                self.errorBlock(ret);
            }
        }
        else
        {
            self.failureBlock(@"response nil");
        }
    } failure:^(YTKBaseRequest *request) {
        // 你可以直接在这里使用 self
        NSLog(@"network error");
    }];
}

@end
