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


@interface QryActivityViewModel() <HTNetworkDelegate>

@end

@implementation QryActivityViewModel

- (void)qryActivyArray
{
    NSString *username = @"13823642844";
    NSString *password = @"123456";
    if (username.length > 0 && password.length > 0) {
        QryActivityRequest *request = [[QryActivityRequest alloc] initWithUsername:username password:password];
        [request startWithDelegate:self];
    }
}

#pragma HTNetworkDelegate

- (void)onRequestFinish:(YTKBaseRequest*)request data:(NSData *)data
{
    NSLog(@"HTNetworkDelegate success:%@", data);
}

- (void)onRequestFail:(YTKBaseRequest*)request errMsg:(NSString *)errMsg
{
    NSLog(@"HTNetworkDelegate fail:%@", errMsg);
}

@end
