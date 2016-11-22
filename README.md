# ZObjcStore

![](logo.png)

![](http://img.shields.io/badge/Swift-3-blue.svg)  ![Version](https://img.shields.io/cocoapods/v/ZObjcStore.svg?style=flat)	![License](https://img.shields.io/cocoapods/l/CmdBluetooth.svg?style=flat)	![Platform](https://img.shields.io/cocoapods/p/CmdBluetooth.svg?style=flat)

ZObjcStore是一个轻量级的对象存储框架。

# 适用于

假如你的项目当中有很多的零散信息需要持久化,数据量少，但是分散。还不至于使用数据库这种庞大的存储框架的时候，ZObjcStore也许非常适合你

# 特性

- 持久化支持多用户
- 对象之间的归档互不影响
- 存储操作简单，再也不需要去编写序列化/反序列化的机械操作

# 安装

###Podfile
在podfile中添加ZObjcStore依赖
```objectivec
pod 'ZObjcStore', '~> 1.0.1'
```
然后运行pod 更新
```objectivec
$ pod install
```

# 使用

###基础用法

 >导入头文件
 ```objectivec
#import <ZObjcStore/ZCodingSupport.h>   
#import <ZObjcStore/ZObjcStore.h>   
```
 
##### 定一个Student模型

 > 注意: 存储的Model类一定要继承`ZCodingSupport`。   

```objectivec
@interface Student : ZCodingSupport

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) int age;

@end
```

##### 更新用户信息

```objectivec 
//更新用户名
+ (void)updateStudentName:(NSString *)name {
    [ZObjcStore update:[Student class] value:name key:@"name"];
}
```

##### 获取用户信息

```objectivec 
+ (NSString *)studentName {
    return [ZObjcStore get:[Student class] key:@"name"];
}
```

### 进阶用法

我们上面已经存储量用户的相关信息，但是每个用户的信息是不一样的，App由｀User_A｀切换到了｀User_B｀账户，B账户肯定不需要A账户的存储信息，而且当｀User_B｀再切回｀User_A｀的时候，项目要保证A账户的信息还在。
> 这个时候，你可以考虑使用ZObjcStore的分管理用户存储功能 `handleContext` ， handleContext方法可以在不同管理用户间快速切换，但是注意，同一时间只能存在一个管理用户。

```objectivec 
+ (void)handleContext:(NSString *)userId {
    [ZObjcStore handleContext:userId];
}
```
