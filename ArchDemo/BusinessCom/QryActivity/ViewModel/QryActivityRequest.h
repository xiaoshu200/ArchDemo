//
//  QryActivityRequest.h
//  ArchDemo
//
//  Created by 方永清 on 08/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTBaseRequest.h"

@interface QryActivityRequest : HTBaseRequest

- (id)initWithUsername:(NSString *)username password:(NSString *)password;

@end
