//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 函数（Functions）
 */

//函数时一段完成特定任务的独立代码片段
//在Swift中，每个函数都有一个由函数的参数值类型和返回值类型组成的类型

//函数的定义和调用
//当定义一个函数时，可以定义一个或多个有名字和类型的值，作为函数的输入，称为参数；也可以定义某种类型的值作为函数执行结束时的输出，称为返回类型
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))

//函数参数与返回值

//无参数函数和多参数函数和无返回值函数
//严格上来说，虽然没有返回值被定义，函数依然返回了值。没有定义返回类型的函数会返回一个特殊的Void值。Void其实是一个空的元组，没有任何元素，可以写成()

//多重返回值函数
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

//可选元组返回类型
//可选元组类型入(Int, Int)?与元组包含可选类型如(Int?, Int?)是不同的，可选的元组类型，整个元组是可选的，而不只是元组中的每个元素值

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

//函数参数标签(argument label)和参数名称(parameter name)
//参数标签在调用函数时使用，调用的时候需要将函数的参数标签写在对应的参数前面，参数名称在函数实现中使用；默认情况下，函数参数使用参数名称来作为它们的参数标签

func greet2(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}

print(greet2(person: "Bill", from: "Cupertino"))
//参数标签的使用能够让一个函数在调用时更有表达力，更类似自然语言，并且仍然保持了函数内部的可读性以及清晰的意图

//忽略参数标签:使用_代替一个明确的参数标签
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    
}

someFunction(1, secondParameterName: 2)

//默认参数值
func someFunction2(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    
}

someFunction2(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction2(parameterWithoutDefault: 4)
//将不带有默认值得参数放在函数参数列表的最前面，因为一般来说没有默认值的参数更加重要

//可变参数:一个可变参数可以接受零个或多个值，函数调用时，可以使用可变参数来指定函数参数可以被传入不确定数量的输入值；通过在变量类型名后面加入...的方式来定义可变参数

//可变参数的传入值在函数体重变为此类型的一个数组
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    
    return total / Double(numbers.count)
}
//一个函数最多只能拥有一个可变参数
print(arithmeticMean(1,2,3,4))

//输入输出参数
//如果想要一个函数可以修改参数的值，并且希望这些修改在函数调用结束后仍然存在，那么应该把这个参数定义为输入输出参数(In-Out Parameters)，在参数定义前面加上inout关键字

//一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值
//只能传入变量给输入输出参数，不能传入常量或者字面量。当传入的参数作为输入输出参数时，需要在参数名前加&符号，表示这个值可以被函数修改

//输入输出参数不能有默认值，而且可变参数不能用inout标记
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var t1 = 10, t2 = 5
swapTwoInts(&t1, &t2)
print(t1, t2)

//输入输出参数和返回值是不一样的，输入输出参数时函数对函数体外产生影响的另一种方式

//函数类型：由函数的参数类型和返回类型组成
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
//以上函数是(Int, Int) -> Int类型的

func printHelloWorld() {
    print("Hello, world")
}
//以上函数时() -> Void类型的

//使用函数类型：在定义一个类型为函数的常量或变量时使用
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")

//有相同匹配类型的不同函数可以被赋值给同一个变量，就像非函数类型的变量一样
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

mathFunction = multiplyTwoInts(_:_:)
print("Result: \(mathFunction(2, 3))")

//Swift可以使用类型推断推断出函数变量或常量的类型
let anotherMathFunction = addTwoInts        //anotherMathFunction被推断为(Int, Int) -> Int类型

//函数类型作为参数类型
func printMathresult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathresult(addTwoInts(_:_:), 3, 5)

//函数类型作为返回类型
func stepForWard(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    print("One step...")
    return backward ? stepBackward : stepForWard
}

var currentValue = 3
repeat {
    let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
    currentValue = moveNearerToZero(currentValue)
    print(currentValue)
} while currentValue > 0

currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue > 0 {
    print(currentValue)
    currentValue = moveNearerToZero(currentValue)
}

//嵌套函数
//全局函数(global functions)定义在全局域中；嵌套函数(nested functions)定义在别的函数体中

//默认情况下，嵌套函数是对外界不可见的，但是可以被它们的外围函数(enclosing function)调用。一个外围函数也可以返回它的某一个嵌套函数，使得这个函数可以在其他域中被使用
func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
    func stepForWard(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    return backward ? stepBackward : stepForWard
}

currentValue = -4
let test = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print(currentValue)
    currentValue = test(currentValue)
}

















