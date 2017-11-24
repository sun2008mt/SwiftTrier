//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 类和结构体
 */

//显示器像素分辨率
struct Resolution {
    var width = 0
    var height = 0
}

//视频显示器模式
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//生成实例
let someResolution = Resolution()       //值类型
let someVideoMode = VideoMode()         //引用类型

//属性访问
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

//为属性赋值
someVideoMode.resolution.width = 1280
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

//结构体的成员逐一构造器:所有结构体都有一个自动生成的成员逐一构造器
let vga = Resolution(width: 640, height: 480)

print("============================")

//结构体和枚举是值类型，而类是引用类型
//值类型被赋予一个变量、常量或者被传递给一个函数的时候，其值会被拷贝
//在swift中，所有的基本类型，包括数组和字典都是值类型，并且在底层都是以结构体的形式所实现
let hd = Resolution(width: 1920, height: 1280)
var cinema = hd       //值类型赋值会进行深拷贝
cinema.width = 2048
print("hd is still \(hd.width) pixels wide")
print("cinema is now \(cinema.width) pixels wide")

enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East

if rememberedDirection == .West {
    print("The remembered direction is still .West")
}

//引用类型被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

//引用类型被声明为常量，但由于它们存储的只是实例对象的引用，因此是可以改变其属性值的

//恒等运算符：用来判定两个常量或者变量是否引用同一个类实例
//等价于: ===
//不等价于: !==
//等于: ==       用来比较两个常量或者变量的值是否相同
//不等于: !=

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same Resolution instance.")
}

//“等价于“表示两个类类型(class type)的常量或者变量引用同一个类实例
//”等于“表示两个实例的值”相等“或”相同“，判定时要遵照设计者定义的评判标准

//类和结构体的选择
/*
 * 考虑使用结构体的情况：
 * (1)该数据结构的主要目的是用来封装少量相关简单数据值
 * (2)有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用
 * (3)该数据结构中存储的值类型属性，也应该被拷贝，而不是被引用
 * (4)该数据结构不需要去继承另一个既有类型的属性或者行为
 */

//swift中，诸如String、Array和Dictionary类型均以结构体的形式实现，是值类型
//而Objective-C中，NSString、NSArray和NSDictionary类型均以类的形式实现，是引用类型
