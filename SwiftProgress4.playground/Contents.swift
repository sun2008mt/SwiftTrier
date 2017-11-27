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
var someInts2 = Array<Int>()

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

//集合类型语法
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items")

letters.insert("a")
letters = []

//用数组字面量创建集合
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
print(favoriteGenres)

var favoriteGeres2: Set = ["Rock"]

//访问和修改一个集合
print("I have \(favoriteGenres.count) favorite music genres")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky")
} else {
    print("I have particular music preferences")
}

//insert，插入新元素
favoriteGenres.insert("Jazz")

//remove和removeAll
if let removeGenre = favoriteGenres.remove("Rock") {
    print("\(removeGenre)? I'm over it")
} else {
    print("I never much cared for that")
}

//contains，是否包含某元素
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot")
} else {
    print("It's too funky in here")
}

//遍历集合
for genre in favoriteGenres {
    print("\(genre)")
}

//sorted,排序元素
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

//基本集合操作
let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

//intersection，交集
var intersection = oddDigits.intersection(singleDigitPrimeNumbers).sorted()   //返回的是数组对象
print(intersection)
print(type(of: intersection))

//symmetricDifference，交集的补集
var symmetricDifference = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
print(symmetricDifference)
print(type(of: symmetricDifference))

//union,并集
var union = oddDigits.union(evenDigits).sorted()
print(union)
print(type(of: union))

//subtracting,差集
var subtracting = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
print(subtracting)
print(type(of: subtracting))

//使用==来判断两个集合是否包含全部相同的值
//使用isSubset来判断一个集合中的值是否也被包含在另外一个集合中
//使用isSuperset来判断一个集合是否包含另一个集合中所有的值
//使用isStrictSubset或isStrictSuperset判断一个集合是否是另一个集合的子集或父集并且两个集合并不相等
//使用isDisjoint来判断两个集合是否不含有相同的值(完全不相交)

let houseAnimals: Set = ["aa", "bb"]
let farmAnimals: Set = ["aa", "bb", "cc", "dd", "ee"]
let cityAnimals: Set = ["cc", "dd"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
houseAnimals.isDisjoint(with: cityAnimals)
farmAnimals.isStrictSuperset(of: houseAnimals)

//字典:每个值都关联唯一的键
//Swift中的Dictionary类型被桥接到Foundation的NSDictionary类
//一个字典的Key类型必须遵循Hashable协议，和Set的值类型一样

//创建一个空字典
var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "sisteen"
namesOfIntegers = [:]

//用字典字面量创建字典
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//访问和修改字典
print("The dictionary of airports contains \(airports.count) items")

if airports.isEmpty {
    print("The airports dictionary is empty")
} else {
    print("The airports dictionary is not empty")
}

airports["LHR"] = "London"

airports["LHR"] = "London Heathrow"

//updateValue会返回旧值
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

//下标访问
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport is not in the airports dictionary")
}

airports["APL"] = "Apple Internation"
airports["APL"] = nil        //赋值nil表明删除

//removeValue会返回被移除的值或nil
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue)")
} else {
    print("The airports dictionary does not contain a value for DUB")
}

//字典遍历
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

//sorted
for airportCode in airports.keys.sorted() {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values.sorted() {
    print("Airport name: \(airportName)")
}

print(type(of: airports.keys))      //Keys类型

//将Keys类型转化为数组类型
let airportCodes = [String](airports.keys)
print(airportCodes)

let airportNames = [String](airports.values)
print(airportNames)






































