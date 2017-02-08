//
//  QryActivityRequest.h
//  ArchDemo
//
//  Created by 方永清 on 08/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArchBaseRequest.h"

@interface QryActivityRequest : ArchBaseRequest

- (id)initWithUsername:(NSString *)username password:(NSString *)password;

@end
