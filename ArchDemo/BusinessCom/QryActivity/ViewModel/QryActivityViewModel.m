//
//  QryActivityViewModel.m
//  ArchDemo
//
//  Created by 方永清 on 08/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import "QryActivityViewModel.h"

#import "YTKNetworkConfig.h"
#import "QryActivityRequest.h"
#import "ActivityListModel.h"
#import "NSObject+YYModel.h"


@interface QryActivityViewModel()

@end

@implementation QryActivityViewModel

- (void)qryActivyArray
{
    NSString *username = @"13823642844";
    NSString *password = @"123456";
    if (username.length > 0 && password.length > 0) {
        QryActivityRequest *request = [[QryActivityRequest alloc] initWithUsername:username password:password];
        [request setBlockWithReturnBlock:^(id returnValue)
         {
             //请求成功
             NSLog(@"response success:%@", returnValue);
             ActivityListModel *model = [ActivityListModel yy_modelWithJSON:returnValue];
             self.returnBlock(model);
         } withErrorBlock:^(NSInteger errorCode) {
             //返回错误
             NSLog(@"errcode:%d", errorCode);
             self.errorBlock(errorCode);
         } withFailureBlock:^(NSString *msg){
             //请求失败
             NSLog(@"response error:%@", msg);
             self.failureBlock(msg);
         }];
        [request sendRequest];
    }
}

@end
