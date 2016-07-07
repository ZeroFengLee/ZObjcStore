//
//  Teacher.h
//  ZObjcStore
//
//  Created by Zero on 16/7/7.
//  Copyright © 2016年 Zero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZObjcStore/ZCodingSupport.h>

@interface Teacher : ZCodingSupport

@property (nonatomic, strong) NSString *course;

@property (nonatomic, assign) int level;

@end
