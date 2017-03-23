//
//  MovieListRequest.m
//  ArchDemo
//
//  Created by elegance on 17/3/10.
//  Copyright © 2017年 com.pingan. All rights reserved.
//

#import "MovieListRequest.h"

@implementation MovieListRequest


- (NSString *)requestUrl {
    return @"/v2/movie/top250";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

//- (id)requestArgument {
//    return @{
//             };
//}

@end
