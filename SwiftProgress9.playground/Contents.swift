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

