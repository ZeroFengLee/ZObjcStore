# ZObjcStore

ZObjcStore是一个轻量级的对象存储框架。

# 适用于

假如你的项目当中有很多的零散信息需要持久化,数据量少，但是分散。还不至于使用数据库这种庞大的存储框架的时候，PieceStore也许非常适合你

# 特性

- 持久化支持多用户
- 对象之间的归档互不影响
- 存储操作简单，再也不需要去编写序列化/反序列化的机械操作

# 安装

###Podfile
在podfile中添加ZObjcStore依赖
```objectivec
pod 'PieceStore', '~> 1.0.0'
```
然后运行pod 更新
```objectivec
$ pod install
```

# 使用

###基础用法

 假如项目有个需求，需要存储用户的信息，在没有网络的情况下也可以显示
 
##### 定一个UserInfo模型

 > 注意: 存储的Model类一定要继承`CodingSupport`。   

```objectivec
class UserInfo: CodingSupport {
    var username: String = "default" //用户名
    var userSex: Bool = true //用户性别
}
```

##### 更新用户信息

```objectivec 
//更新用户名
func updateUserInfoName(name: String) {
    PieceStore.update(UserInfo.self, value: name, key: "username")
}
//更新用户性别
func updateUserInfoSex(sex: Bool) {
    PieceStore.update(UserInfo.self, value: sex, key: "userSex")
}
```

##### 获取用户信息

```objectivec 
func getUserInfoName() -> String {
    return PieceStore.get(UserInfo.self, key: "username") as! String
}
```

### 进阶用法

我们上面已经存储量用户的相关信息，但是每个用户的信息是不一样的，App由｀User_A｀切换到了｀User_B｀账户，B账户肯定不需要A账户的存储信息，而且当｀User_B｀再切回｀User_A｀的时候，项目要保证A账户的信息还在。
> 这个时候，你可以考虑使用PieceStore的分管理用户存储功能 `handleContext` ， handleContext方法可以在不同管理用户间快速切换，但是注意，同一时间只能存在一个管理用户。
```objectivec 
func handleContext(id: String) {
    PieceStore.handleContext(id)
}
```