//
//  UserModel.h
//  ArchiverDemo
//
//  Created by co-meite on 15/10/29.
//  Copyright © 2015年 co-meite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerialiazaionKey.h"

@interface UserModel : SerialiazaionKey<NSCoding>

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *userMessage;

@end
