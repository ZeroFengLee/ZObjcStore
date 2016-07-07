//
//  MyUserDefault.h
//  ZObjcStore
//
//  Created by Zero on 16/7/7.
//  Copyright © 2016年 Zero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyUserDefault : NSObject

+ (void)handleContext:(NSString *)userId;

+ (void)updateStudentName:(NSString *)name;

+ (void)updateTeacherLevel:(NSInteger)age;

+ (NSString *)studentName;

+ (NSInteger)teacherLevel;

@end
