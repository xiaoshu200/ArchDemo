//
//  ArchBaseViewModel.m
//  ArchDemo
//
//  Created by 方永清 on 08/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import "ArchBaseViewModel.h"

@implementation ArchBaseViewModel

#pragma 接收穿过来的block
-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 withErrorBlock: (ErrorCodeBlock) errorBlock
               withFailureBlock: (FailureBlock) failureBlock
{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}

@end
