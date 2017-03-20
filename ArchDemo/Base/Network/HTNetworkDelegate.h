//
//  HTNetworkDelegate.h
//  ArchDemo
//
//  Created by 方永清 on 16/03/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#ifndef HTNetworkDelegate_h
#define HTNetworkDelegate_h

#import <Foundation/Foundation.h>

@class YTKBaseRequest;

@protocol HTNetworkDelegate <NSObject>

@required

- (void)onRequestFinish:(YTKBaseRequest*)request data:(NSData *)data;

- (void)onRequestFail:(YTKBaseRequest*)request errMsg:(NSString *)errMsg;

@end

#endif /* HTNetworkDelegate_h */
