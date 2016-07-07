//
//  ZObjcStore.m
//  ObjcStore
//
//  Created by Zero on 16/7/7.
//  Copyright © 2016年 Zero. All rights reserved.
//

#import "ZObjcStore.h"
#import <objc/runtime.h>

@implementation ZObjcStore

static NSString *userKey = @"user_id";
static NSString *defaultUserName = @"default";

+ (void)handleContext:(NSString *)userId {
    
    [[NSUserDefaults standardUserDefaults] setObject:userId forKey:userKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)userId {
    
    return [[NSUserDefaults standardUserDefaults] stringForKey:userKey];
}

+ (void)saveInfo:(id)objc {
    
    id infoData = [NSKeyedArchiver archivedDataWithRootObject:objc];
    NSString *clsName = [NSString stringWithCString:object_getClassName(objc) encoding:NSUTF8StringEncoding];
    [[NSUserDefaults standardUserDefaults] setObject:infoData forKey:[NSString stringWithFormat:@"user_id_%@_type_%@", ZObjcStore.userId, clsName]];
}

+ (id)getInfo:(Class)cls {
    
    NSString *clsName = [NSString stringWithCString:class_getName(cls) encoding:NSUTF8StringEncoding];
    NSData *infoData = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"user_id_%@_type_%@", ZObjcStore.userId, clsName]];
    id info = [NSKeyedUnarchiver unarchiveObjectWithData:infoData];
    if (info == nil) {
        return [[NSClassFromString(clsName) alloc] init];
    }
    return info;
}

+ (void)update:(Class)modelClass value:(id)value key:(NSString *)key {
    
    id info = [ZObjcStore getInfo:modelClass];
    [info setValue:value forKey:key];
    [ZObjcStore saveInfo:info];
}

+ (id)get:(Class)modelClass key:(NSString *)key {
    
    id value = [[ZObjcStore getInfo:modelClass] valueForKey:key];
    return value;
}

@end
