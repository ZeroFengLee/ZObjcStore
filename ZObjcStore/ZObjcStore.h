//
//  ZObjcStore.h
//  ObjcStore
//
//  Created by Zero on 16/7/7.
//  Copyright © 2016年 Zero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZObjcStore : NSObject

/*
    @function 切换管理用户
 */
+ (void)handleContext:(NSString *)userId;

/*
    @function   更新信息
 */
+ (void)update:(Class)modelClass value:(id)value key:(NSString *)key;

/*
    @function   获取信息
 */
+ (id)get:(Class)modelClass key:(NSString *)key;

/*
    @function   保存Model对象
 */
+ (void)saveInfo:(id)objc;

/*
    @function 获取Model对象
 */
+ (id)getInfo:(Class)cls;
@end
