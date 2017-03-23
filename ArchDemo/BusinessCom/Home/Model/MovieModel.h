//
//  MovieModel.h
//  ArchDemo
//
//  Created by elegance on 17/3/18.
//  Copyright © 2017年 com.pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject
@property(nonatomic, copy)NSNumber *count;
@property(nonatomic, copy)NSNumber *start;
@property(nonatomic, copy)NSArray *subjects;    //sujects<movieDetailModel>
@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSNumber *total;

@end
