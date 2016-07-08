//
//  ZCodingSupport.m
//  ObjcStore
//
//  Created by Zero on 16/7/7.
//  Copyright © 2016年 Zero. All rights reserved.
//

#import "ZCodingSupport.h"
#import <objc/runtime.h>

@implementation ZCodingSupport

- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for(unsigned int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSString *key = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    if (ivars) {
        free(ivars);
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        unsigned int count;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for(unsigned int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        if (ivars) {
            free(ivars);
        }
    }
    return self;
}

@end
