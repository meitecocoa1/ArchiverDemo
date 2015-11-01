//
//  UserModel.m
//  ArchiverDemo
//
//  Created by co-meite on 15/10/29.
//  Copyright © 2015年 co-meite. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.userId forKey:@"userId"];
    [aCoder encodeObject:self.userMessage forKey:@"userMessage"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self == [super init]) {
     
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.userId = [aDecoder decodeObjectForKey:@"userId"];
        self.userMessage = [aDecoder decodeObjectForKey:@"userMessage"];
    }
    return self;
}


@end
