//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 枚举(Enumerations)
 */

//枚举为一组相关的值定义了一个共同的类型，使你可以在你的代码中以类型安全的方式来使用这些值

//在Swift中，不必给每个枚举成员提供一个值，如果给枚举成员提供一个值(称为“原始”值)，则该值得类型可以是字符串、字符，或是一个整型值或浮点数；此外，枚举成员可以指定任意类型的关联值存储到枚举成员中，就像其他语言中的联合体(unions)和变体(variants)。可以在一个枚举定义中定义一组相关的枚举成员，每一个枚举成员都可以有适当类型的关联值

//在Swift中，枚举类型是一等(first-class)类型，包含特性如计算属性、实例方法等；枚举也可以定义构造函数来提供一个初始值；可以在原始实现的基础上扩展它们的功能；还可以遵循协议来提供标准的功能

//枚举语法:使用enum关键字来创建枚举并把它们的整个定义放在一对大括号内
enum CompassPoint {
    case north     //枚举中定义的值是这个枚举的成员值
    case south
    case east
    case west
}

//与C和Objective-C不同，Swift的枚举成员在被创建时不会被赋予一个默认的整型值，在上面的例子中，north、south、east和west不会被隐式地赋值为0、1、2、3；相反，这些枚举成员本身就是完备的值，这些值得类型是已经明确定义好的CompassPoint类型
print(type(of: CompassPoint.north))

//多个成员值可以出现在同一行上，用逗号隔开
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

//每个枚举定义了一个全新的类型
var directionToHead = CompassPoint.west
directionToHead = .east         //已经确定类型，可以省略枚举类型名

//使用switch语句匹配枚举值
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

//强制穷举:switch语句必须穷举所有的情况，否则无法通过编译
//当不需要匹配每个枚举成员的时候，可以提供一个default分支来涵盖所有未明确处理的枚举成员
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

//关联值
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

//Barcode类型的常量和变量可以存储一个.upc或者一个.qrCode(连同它们的关联值)，但是在同一时间只能存储这两个值中的一个
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
print(productBarcode)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
print(productBarcode)

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}

//如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，可以只在成员名称前标注一个let或var
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case let .qrCode(productCode):
    print("QR code: \(productCode)")
}

//原始值：枚举成员可以被默认值(称为原始值)预填充，这些原始值的类型必须相同
enum ASCIIControlCharacter: Character {     //原始值类型被定义为Character
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
//原始值可以是字符串、字符或者任意整型值或浮点型值，每个原始值在枚举生声明中必须是唯一的

//原始值和关联值是不同的，原始值是定义枚举时被预先填充的值，像上述三个ASCII码；对于一个特定的枚举成员，它的原始值始终不变。关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化

//原始值的隐式赋值
//在使用原始值为整数或者字符串类型的枚举时，不需要显示地为每一个枚举成员设置原始值，Swift会自动赋值：如当使用整数作为原始值时，隐式赋值的值依次递增1.如果第一个枚举成员没有设置原始值，其原始值将为0

enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

//当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称
enum CompassPoint2: String {
    case north, south, east = "east", west
}

//使用枚举成员的rawValue属性可以访问该枚举成员的原始值
let earthsOrder = Planet.earth.hashValue        //没有原始值
let earthsOrder2 = Planet2.earth.rawValue       //隐式原始值
let earthsOrder21 = Planet2.earth.hashValue
print(earthsOrder)
print(earthsOrder2)
print(earthsOrder21)

//使用原始值初始化枚举实例：如果在定义枚举类型的时候使用了原始值，那么将会自动获得一个初始化方法，这个方法接收一个叫做rawValue的参数，参数类型即为原始值类型，返回值则是枚举成员或nil；可以使用这个初始化方法来创建一个新的枚举实例
let possiblePlanet = Planet2(rawValue: 7)
print(type(of: possiblePlanet))
print(possiblePlanet as Any)
//由于并非所有的Int值都可以找到一个匹配的行星，因而原始值构造器总是返回一个可选的枚举成员(Optional)。

let positionToFind = 11
if let somePlanet = Planet2(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

//递归枚举:是一个枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值；使用递归枚举时，编译器会插入一个间接层，可以在枚举成员前加上indirect来表示该成员可递归

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

//也可以在枚举类型开头加上indirect关键字表明它的所有成员都是可递归的
indirect enum ArithmeticExpression2 {
    case number(Int)
    case addition(ArithmeticExpression2, ArithmeticExpression2)
    case multiplication(ArithmeticExpression2, ArithmeticExpression2)
}

//上面的枚举类型可以存储三种算术表达式：纯数字、两个表达式相加和两个表达式相乘。枚举成员addition和multiplication的关联值也是算术表达式——这些关联值使得嵌套表达式成为可能，入表达式（5 + 4） * 2，由于数据是嵌套的，因而用来存储数据的枚举类型也需要支持这种嵌套——这意味着枚举类型需要支持递归

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

//要操作具有递归性质的数据结构，使用递归函数是一种直截了当的方式
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
    return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))



































