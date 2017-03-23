//
//  HTBaseRequest.h
//  ArchDemo
//
//  Created by 方永清 on 16/03/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKRequest.h"
#import "HTNetworkDelegate.h"

@interface HTBaseRequest : YTKRequest

- (void)startWithDelegate:(id<HTNetworkDelegate>)delegate;

@end
