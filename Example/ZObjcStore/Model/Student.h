//
//  Student.h
//  ZObjcStore
//
//  Created by Zero on 16/7/7.
//  Copyright © 2016年 Zero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZObjcStore/ZCodingSupport.h>

@interface Student : ZCodingSupport

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) int age;

@end
