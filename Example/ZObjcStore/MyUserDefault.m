//
//  MyUserDefault.m
//  ZObjcStore
//
//  Created by Zero on 16/7/7.
//  Copyright © 2016年 Zero. All rights reserved.
//

#import "MyUserDefault.h"
#import <ZObjcStore/ZObjcStore.h>
#import "Student.h"
#import "Teacher.h"

@implementation MyUserDefault

+ (void)handleContext:(NSString *)userId {
    [ZObjcStore handleContext:userId];
}

+ (void)updateStudentName:(NSString *)name {
    [ZObjcStore update:[Student class] value:name key:@"name"];
}

+ (void)updateTeacherLevel:(NSInteger)age {
    [ZObjcStore update:[Teacher class] value:@(age) key:@"level"];
}

+ (NSString *)studentName {
    return [ZObjcStore get:[Student class] key:@"name"];
}

+ (NSInteger)teacherLevel {
    return [[ZObjcStore get:[Teacher class] key:@"level"] integerValue];
}

@end
