//
//  SerialiazaionKey.m
//  ArchiverDemo
//
//  Created by co-meite on 15/10/29.
//  Copyright © 2015年 co-meite. All rights reserved.
//

#import "SerialiazaionKey.h"
#import <objc/runtime.h>

@implementation SerialiazaionKey

+ (NSArray *)propertyOfSelf
{
    unsigned int count = 0;
    
    Ivar *ivarList = class_copyIvarList(self, &count);
    NSMutableArray *properNames = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        
        Ivar ivar = ivarList[i];
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *key = [name substringFromIndex:1];
        [properNames addObject:key];
    }
    return [properNames copy];
}


#pragma mark NSCoding

//归档
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    NSArray *properNames = [[self class]propertyOfSelf];
    for (NSString *propertyName in properNames) {
        
        SEL getSel = NSSelectorFromString(properNames);
        [aCoder encodeObject:[self performSelector:getSel] forKey:propertyName];
    }
}

//接档
- (id)initWithCoder:(NSCoder *)aDecoder
{
    NSArray *properNames = [[self class]propertyOfSelf];
    for (NSString *properName in properNames) {
        
        NSString *firstCharater = [properName substringToIndex:1].uppercaseString;
        NSString *setPropertyName = [NSString stringWithFormat:@"set%@%@",firstCharater,[properName substringFromIndex:1]];
        SEL setSel = NSSelectorFromString(setPropertyName);
        [self performSelector:setSel withObject:[aDecoder decodeObjectForKey:properName]];
    }
    return self;
}

#pragma maek other

- (NSString *)description
{
    NSMutableString *descriptionString = [NSMutableString stringWithFormat:@"\n"];
    NSArray *propertyNames = [[self class]propertyOfSelf];
    for (NSString *propertyName in propertyNames) {
        
        SEL getSel = NSSelectorFromString(propertyName);
        
        NSString *propertyNameString = [NSString stringWithFormat:@"%@ - %@\n",propertyName,[self performSelector:getSel]];
        [descriptionString appendString:propertyNameString];
    }
    return [descriptionString copy];
}

@end
