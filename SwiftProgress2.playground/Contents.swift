//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 基本运算符(Basic Operators)
 */

//运算符分为一元、二元和三元运算符
//一元运算符又分为前置运算符和后置运算符

//赋值运算符: Swift的赋值操作并不返回任何值
//如果赋值的右边是一个多元组，它的元素可以马上被分解成多个常量或变量
let (x, y) = (1, 2)
print("x is \(x), y is \(y)")

//算术运算符
//Swift默认情况下不允许在数值运算中出现溢出情况，但可以用Swift的溢出运算符来实现溢出运算

1 + 2
5 - 3
2 * 3
10.0 / 2.0

"hello, " + "world"      //需要保证参与运算的数据类型一致

//求余运算符

9 % 4      //1
-9 % 4     //-1

//在对负数b求余时，b的符号会被忽略。这意味着a % b和a % -b的结构是相同的
9 % 4        //1
9 % -4       //1

//一元负号运算符和一元正号运算符
let three = 3
let minusThree = -three
let alsoMinusThree = +minusThree

//组合赋值运算符
var a = 1
a += 2

var c = 1
var d = c += 2
print("c is \(c), d is \(d)")        //c is 3, d is ()
print(d)

//比较运算符
1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}

//比较元组大小会按照从左到右、逐值比较的方式，直到发现有两个值不等时停止
(1, "zebra") < (2, "apple")      //true (如果第一组满足条件，返回true，不再进行后面的比较)
(3, "apple") < (3, "bird")      //true  (如果第一组相同，进行第二组比较)
(3, "apple") < (2, "bird")      //false（如果第一组不满足，返回false）
(4, "dog") == (4, "dog")        //true  (每组都相等才相等)
//Swift标准库只能比较七个以内元素的元组比较函数；如果元组的元素超过了七个，需要自己实现比较运算符

//三目运算符
let contentHeight = 40
var hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
print(rowHeight)
hasHeader = false
let rowHeight2 = contentHeight + (hasHeader ? 50 : 20)
print(rowHeight2)

//空合运算符(a ?? b)将对可选类型a进行空判断，如果a包含一个值就进行解封，否则就返回一个默认值b；表达式a必须是Optional类型，默认值b的类型必须要和a存储值得类型保持一致
//如果a为非空值(non-nil)，那么值b将不会被计算，这也是所谓的短路求值
let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

//区间运算符
//闭区间运算符(a...b): 定义一个包含从a到b（包括a和b）的所有值的区间，a的值不能超过b
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

//半开区间运算符(a..<b): 定义一个从a到b但不包括b的区间（包含a，但不包含b）
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第\(i + 1)个人叫\(names[i])")
}

//逻辑运算符（!, &&, ||）
let allowedEntry = false
if !allowedEntry {
    print("Access Denied")
}

//短路计算(short-circuit evaluation)：如果第一个值为false，那么是不去计算第二个值得，因为它已经不可能影响整个表达式的结果了
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome")
} else {
    print("Access Denied")
}

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome")
} else {
    print("Access Denied")
}

//使用括号来明确优先级
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome")
} else {
    print("Access Denied")
}






