### 创建字典

- Swift字典的`key`没有类型限制，可以是整型或字符串，但必须是唯一的。
- 创建一个字典，并赋值给一个变量，则创建的字典就是可以修改的。这意味着在创建字典后，可以通过添加、删除、修改的方式改变字典里的项目。
- 将一个字典赋值给常量，字典就不可修改，并且字典的大小和内容都不可以修改。

```swift
var dict = [Int: String]()
var dict: [Int: String] = [1: "One", 2: "Two", 3: "Three"]
```

### 访问字典

- 根据字典的索引来访问数组的元素

```swift
var dict: [Int: String] = [1: "One", 2: "Two", 3: "Three"]
print( "key = 1 的值为 \(dict[1])" ) //key = 1 的值为 Optional("One")
print( "key = 2 的值为 \(dict[2])" ) //key = 2 的值为 Optional("Two")
print( "key = 3 的值为 \(dict[3])" ) //key = 3 的值为 Optional("Three")
```

### 修改字典

- 如果存在则修改key对应的值；如果key不存在，则添加值。

- 通过指定的key来修改字典的值

  ```swift
  var dict: [Int: String] = [1: "One", 2: "Two", 3: "Three"]
  dict[4] = "四"
  print(dict[4]) //Optional("四")
  ```

- 使用`updateValue(forKey:)`方法

  ```swift
  var dict: [Int: String] = [1: "One", 2: "Two", 3: "Three"]
  let oldKV = dict.updateValue("四", forKey: 4)
  print( "key = 4 的旧值为 \(oldKV)" ) //key = 4 的旧值为 nil
  print( "key = 4 的新值为 \(dict[4])" ) //key = 4 的新值为 Optional("四")
  ```

### 移除`Key-Value`对

- 指定键的值为nil来移除`Key-Value`

  ```swift
  var dict: [Int: String] = [1: "One", 2: "Two", 3: "Three"]
  dict[1] = nil
  print(dict) //[2: "Two", 3: "Three"]
  ```

- 使用`removeValueForKey()`方法

  ```swift
  var dict: [Int: String] = [1: "One", 2: "Two", 3: "Three"]
  dict.removeValue(forKey: 1)
  print(dict) //[2: "Two", 3: "Three"]
  ```

### 遍历字典

```swift
var dict: [Int: String] = [1: "One", 2: "Two", 3: "Three"]
for (key, value) in dict {
    print("key: \(key) - value: \(value)")
}
//key: 1 - value: One
//key: 2 - value: Two
//key: 3 - value: Three
```

### 字典转换为数组

```swift
var dict: [Int: String] = [1: "One", 2: "Two", 3: "Three"]
let dictKeys = [Int](dict.keys)
let dictValues = [String](dict.values)
        
print("输出字典的键(key)") //输出字典的键(key)：1 3 2
for (key) in dictKeys {
    print("\(key)")
}
        
print("输出字典的值(value)") //输出字典的值(value)：One Three Two
for (value) in dictValues {
    print("\(value)")
}
```

### `count`属性：获取字典键值对数量

```swift
var dict: [Int: String] = [1: "One", 2: "Two", 3: "Three"]
print(dict.count) //3
```

### `isEmpty`属性：判断字典是否为空

```swift
var dict1: [Int: String] = [1: "One", 2: "Two", 3: "Three"]
var dict2 = [Int: String]()
print(dict1.isEmpty) //false
print(dict2.isEmpty) //true
```