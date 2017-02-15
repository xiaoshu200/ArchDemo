//
//  ArchBaseRequest.h
//  ArchDemo
//
//  Created by 方永清 on 08/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKRequest.h"

//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (NSInteger errorCode);
typedef void (^FailureBlock)(NSString *msg);

@interface ArchBaseRequest : YTKRequest

@property (strong, nonatomic) ReturnValueBlock returnBlock;
@property (strong, nonatomic) ErrorCodeBlock errorBlock;
@property (strong, nonatomic) FailureBlock failureBlock;

// 传入交互的Block块
-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 withErrorBlock: (ErrorCodeBlock) errorBlock
               withFailureBlock: (FailureBlock) failureBlock;

- (void)sendRequest;

@end
