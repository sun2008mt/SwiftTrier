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
func someFunctionThatTakesAClosure(closure: () -> Void) {
    closure()
    print("函数体部分...")
}

//不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    print("不使用尾随闭包的闭包主体部分...")
})

//使用尾随闭包进行调用
someFunctionThatTakesAClosure {
    print("使用尾随闭包的闭包主体部分...")
}

//如果需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性，尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用
anotherNames = names.sorted() { $0 > $1 }
print("尾随闭包版本：", anotherNames)

//如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把()省略掉
anotherNames = names.sorted { $0 > $1 }
print("尾随闭包并且闭包表达式是唯一参数，可以去掉()：", anotherNames)

//当闭包非常长以至于不能在一行中进行书写时，尾随闭包会非常有用
//Swift的Array类型有一个map(_:)方法，获取一个闭包表达式作为其唯一参数；该闭包函数会为数组中的每一个元素所调用一次，并返回该元素所映射的值，最后将返回一个新数组，数组中包含了与原数组中的元素一一对应的映射后的值
let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output      //字典下标表达式返回的是Optional类型
        number /= 10
    } while  number > 0
    return output
}
print(strings)
//字典下标返回一个可选值(optional value)， 表明该键不存在时会查找失败
//通过尾随闭包语法，优雅地在函数后封装了闭包的具体功能，而不需要将整个闭包包裹在map(_:)方法的括号内

//值捕获：闭包可以在其被定义的上下文中捕获常量或变量，即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

var incrementerByFour = makeIncrementer(forIncrement: 4)
print(incrementerByFour())
print(incrementerByFour())

//会有另一个全新的、独立的runningTotal变量
var incrementerByFive = makeIncrementer(forIncrement: 5)
print(incrementerByFive())
print(incrementerByFive())

//increment()函数没有任何参数，但是在函数体内访问了runningTotal和amount变量，这是因为它从外围函数捕获了runningTotal和amount变量的引用；捕获引用保证了runningTotal和amount变量在调用完makeIncrementer后不会消失，并且保证了在下一次执行incrementer函数时，runningTotal依旧存在

//为了优化，如果一个值不会被闭包改变，或者在闭包创建后不会改变，Swift可能会改为捕获并保存一份对值得拷贝；Swift也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量

//如果你将闭包赋值给一个类实例的属性，并且该闭包通过访问该实例或其成员而捕获了该实例，你将在闭包和该实例之间创建一个循环强引用，Swift使用捕获列表来打破这种循环强引用

//闭包是引用类型:函数和闭包都是引用类型
//无论你将函数或闭包赋值给一个常量还是变量，你实际上都是将常量或变量的值设置为对应函数或闭包的引用
//如果将闭包赋值给两个不同的常量或变量，两个值都会指向同一个闭包
let alsoIncrementByFour = incrementerByFour
print(alsoIncrementByFour())

//逃逸闭包：当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当定义接受闭包作为参数的函数时，可以在参数名之前标注@escaping，用来指明这个闭包是允许逃逸出这个函数的，否则这个闭包只能被调用或者被弃用

//一种能够使闭包逃逸出函数的方法时，将这个闭包保存在一个函数外部定义的变量中。很多启动异步操作的函数接受一个闭包参数作为completion handler，这类函数在异步操作开始之后立刻返回，但是闭包直到异步操作结束后才会被调用
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNoescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        //将一个闭包标记为@escaping意味着你必须在闭包中显示地引用self
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNoescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
//首先执行了没有逃逸闭包的函数
print(instance.x)      //200

//在函数执行完成之后执行逃逸闭包
completionHandlers.first?()
print(instance.x)      //100

let test = [1,2,3,4,5]
print(test.first!)
print(test.last!)
print(test.max()!)
print(test.min()!)

//自动闭包
//自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式,这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利的语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包

//自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }    //() -> String类型
print(customersInLine.count)

//在调用闭包时才执行自动闭包里面的操作
print("Now serving \(customerProvider())!")
print(customersInLine.count)

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: { customersInLine.remove(at: 0) })

//@autoclosure表示接收一个自动闭包
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: customersInLine.remove(at: 0))
//过度使用@autoclosure会让代码变得难以理解，上下文和函数名应该能够清晰地表明求值是被延迟执行的

//如果希望一个自动闭包可以逃逸，应该同时使用@autoclosure和@escaping属性
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
print("Collected \(customerProviders.count) closures")
collectCustomerProviders(customersInLine.remove(at: 0))
print("Collected \(customerProviders.count) closures")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}











