//
//  MovieListViewModel.m
//  ArchDemo
//
//  Created by elegance on 17/3/10.
//  Copyright © 2017年 com.pingan. All rights reserved.
//

#import "MovieListViewModel.h"
#import "MovieListRequest.h"

@implementation MovieListViewModel
- (void)requestMovieList
{
        MovieListRequest *request = [[MovieListRequest alloc] init];
        [request setBlockWithReturnBlock:^(id returnValue)
         {
             //请求成功
             NSLog(@"response success:%@", returnValue);
//             ActivityListModel *model = [ActivityListModel yy_modelWithJSON:returnValue];
//             self.returnBlock(model);
         } withErrorBlock:^(NSInteger errorCode) {
             //返回错误
             NSLog(@"errcode:%ld", (long)errorCode);
//             self.errorBlock(errorCode);
         } withFailureBlock:^(NSString *msg){
             //请求失败
             NSLog(@"response error:%@", msg);
//             self.failureBlock(msg);
         }];
        [request sendRequest];
}
@end
