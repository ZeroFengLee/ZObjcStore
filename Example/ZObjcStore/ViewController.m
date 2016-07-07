//
//  ViewController.m
//  ZObjcStore
//
//  Created by Zero on 16/7/7.
//  Copyright © 2016年 Zero. All rights reserved.
//

#import "ViewController.h"
#import "MyUserDefault.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [MyUserDefault handleContext:@"U001"];
    [MyUserDefault updateStudentName:@"Zero"];
    [MyUserDefault updateTeacherLevel:3];
    
    NSString *studentName = [MyUserDefault studentName];
    NSInteger teacherLevel = [MyUserDefault teacherLevel];
    
    NSLog(@"student name is %@, teacher's level is %ld", studentName, teacherLevel);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
