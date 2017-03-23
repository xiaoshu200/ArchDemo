//
//  MovieModel.m
//  ArchDemo
//
//  Created by elegance on 17/3/18.
//  Copyright © 2017年 com.pingan. All rights reserved.
//

#import "MovieModel.h"
#import "MovieDetailModel.h"

@implementation MovieModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"subjects" : [MovieDetailModel class],
             };
}
@end
