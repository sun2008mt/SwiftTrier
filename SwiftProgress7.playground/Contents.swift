//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 闭包(Closures)
 */

//闭包是自包含的函数代码块，可以在代码中被传递和使用
//闭包可以捕获和存储其所在上下文中任意常量和变量的引用，被称为包裹常量和变量，Swift会为你管理在捕获(capturing)过程中涉及到的所有内存操作

//闭包有三种形式：
//1.全局函数是一个有名字但不会捕获任何值的闭包
//2.嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
//3.闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包

//闭包表达式：一种利用简洁语法构建内联闭包的方式
//嵌套函数是一个在较复杂函数中方便进行命名和定义自包含代码模块的方式

//sorted方法
//Swift标准库提供了名为sorted(by:)的方法，它会根据你所提供的用于排序的闭包函数将已知类型数组中的值进行排序，并且返回一个与原数组大小相同，包含同类型元素且元素已经正确排序的新数组，原数组不会被方法修改

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

//传入函数作为sorted函数的参数，提供比较两个同类型变量的方法
var resversedNames = names.sorted(by: backward)
print("函数作为参数：", resversedNames)

//闭包表达式语法
// {parameters -> returnType in
//   statements
// }

//闭包表达式参数可以是in-out参数，但不能设定默认值，也可以是具名的可变参数(但如果可变参数不放在参数列表的最后一位，调用闭包时编译器将报错)
var anotherNames = names.sorted(by: {
    (s1: String, s2: String) -> Bool in
        return s2 > s1
})
print("内联闭包表达式：", anotherNames)

//内联闭包参数和返回值类型声明与普通的backward(_:_:)函数类型声明相同，但是在内联闭包表达式中，函数和返回值类型都写在大括号内
//闭包的函数体部分由关键字in引入，该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始
var stillNames = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 > s2})
print("内联闭包表达式单行版本：", stillNames)

//根据上下文推断类型:根据方法被什么类型的变量调用，可以推断出参数和返回值类型
anotherNames = names.sorted(by: {s1, s2 in return s1 > s2})
print("省略参数类型和返回类型的单行版本：", anotherNames)

//通过内联闭包表达式构造的闭包作为参数传递给函数或方法时，总是能够推断出闭包的参数和返回值类型

//单表达式闭包隐式返回:单行表达式闭包可以通过省略return关键字来隐式返回单行表达式的结果
anotherNames = names.sorted(by: {s1, s2 in s1 > s2})
print("继续省略return关键字版本：", anotherNames)
//单表达式是指statements部分，即闭包函数体部分只包含一个单一表达式，不会产生歧义

//参数名称缩写
//Swift自动为内联闭包提供了参数名称缩写功能，可以直接通过$0, $1, $2来顺序调用闭包的参数
//如果在闭包表达式中使用参数名称缩写，可以在闭包定义中省略参数列表，并且对应参数名称缩写的类型会通过函数类型进行推断；in关键字也同样可以被省略，因为此时闭包表达式完全由闭包函数体构成
anotherNames = names.sorted(by: { $0 > $1 })
print("采用参数名称缩写方式，并且省略in关键字版本：", anotherNames)

//运算符方法
//Swift的String类型定义了关于大于号>的字符串实现，其作为一个函数接受两个String类型的参数并返回Bool类型的值
anotherNames = names.sorted(by: >)
print("使用运算符方法，String类型的>实现：", anotherNames)

//尾随闭包

































