//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 集合类型(Collection Types)
 */

//Swift语言提供Arrays、Sets和Dictionaries三种基本的集合类型用来存储集合数据。Arrays是有序数据集，Sets是无序无重复数据集，Dictionaries是无序的键值对集。
//Swift中集合类型存储的数据类型必须明确

//集合的可变性（值类型）：如果分配成一个变量，集合将会是可变的；如果分配成常量，则集合将是不可变的，其大小和内容都不能被改变

//数组（Arrays）：使用有序列表存储同一类型的多个值，相同的值可以多次出现在一个数组的不同位置中
//Swift的Array类型被桥接到Foundation中的NSArray类

//创建一个空数组
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items")

someInts.append(3)
someInts = []        //空数组，但仍然是[Int]类型的

//创建一个带有默认值的数组
var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)

//通过两个数组相加创建一个数组:使用+组合两种已经存在的相同类型数组
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
print(anotherThreeDoubles)

var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

//用数组字面量构造数组
var shoppingList: [String] = ["Eggs", "Milk"]

//访问和修改数组: 只读属性count
print("The shopping list contains \(shoppingList.count) imtems")

//布尔属性isEmpty
if shoppingList.isEmpty {
    print("The shopping list is empty")
} else {
    print("The shopping list is not empty")
}

//append方法
shoppingList.append("Flour")

//+=运算符
shoppingList += ["Baking Powder"]
print(shoppingList)

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
print(shoppingList)

//下标语法
var firstItem = shoppingList[0]
print(firstItem)

shoppingList[0] = "Six eggs"
print(firstItem)
print(shoppingList[0])

shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)

//不可以用下标访问的形式在数组尾部添加新项
//shoppingList[6] = "Test"      //Index out of range

//insert方法在某个具体索引值之前插入
shoppingList.insert("Maple Syrup", at: 0)
print(shoppingList)

//remove方法移除数组中的某一项,并返回被移除的项
let mapleSyrup = shoppingList.remove(at: 0)
print(shoppingList)
print(mapleSyrup)

//如果我们试着对索引越界的数据进行检索或者设置新值得操作，会引发一个运行期错误。我们可以使用索引值和数组的count属性进行比较来在使用某个索引之前先检验是否有效。除了当count等于0时（空数组）， 最大索引值一直是count - 1，因为数组都是零起索引

//removeLast方法移除最后一项
let apples = shoppingList.removeLast()
print(shoppingList)
print(apples)

//遍历数组
for item in shoppingList {
    print(item)
}

//同时需要每个数据项的值和索引值，使用enumerated()方法
for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}

//Sets用来存储相同类型并且没有确定顺序的值
//Swift的Set类型被桥接到Foundation中的NSSet类

//集合类型的哈希值：一个类型为了存储在Set中，该类型必须是可哈希化的，也就是说必须提供一个方法来计算它的哈希值
//Swift的所有基本类型默认都是可哈希化的，没有关联值得枚举成员值默认也是可哈希化的

//可以使用自定义的类型作为集合的值得类型或者是字典的键的类型，但需要使自定义类型符合Swift标准库中的Hashable协议，符合Hashable协议的类型需要提供一个类型为Int的可读属性hashValue。由类型的hashValue属性返回的值不需要在同一程序的不同执行周期或者不同程序之间保持相同。因为Hashable协议符合Equatable协议，所以遵循该协议的类型也必须提供一个==的实现，Equatable协议要求任何符合==实现的实例间都是一种相等关系: ==实现必须满足以下三种情况:
// a == a(自反性)
// a == b 意味着b == a（对称性）
// a == b && b == c意味着a == c(传递性)







