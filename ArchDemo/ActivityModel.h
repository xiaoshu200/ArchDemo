//
//  ActivityModel.h
//  ArchDemo
//
//  Created by 方永清 on 08/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityModel : NSObject

@property (assign, nonatomic) NSInteger id;                 //id
@property (strong, nonatomic) NSString  *img_url;           //图片url
@property (assign, nonatomic) NSInteger activity_type;      //活动类型 0:默认 1:第三方活动 2:商品列表 3:商品详情 4:商家列表 5:商家详情
@property (strong, nonatomic) NSString  *activity_value;    //活动值
@property (assign, nonatomic) NSInteger add_time;           //添加时间
@property (assign, nonatomic) NSInteger is_valid;           //是否有效 0:无效 1:有效
@property (strong, nonatomic) NSString  *activity_name;     //活动名称

@end
