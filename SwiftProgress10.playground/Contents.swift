//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 属性（properties）
 */
//属性将值跟特定的类、结构或者枚举关联
//属性分为存储属性和计算属性，存储属性存储常量或者变量作为实例的一部分，而计算属性计算一个值
//计算属性可以用于类、结构体和枚举，而存储属性只能用于类和结构体

//存储属性和计算属性通常与特定类型的实例关联。但是，属性也可以直接作用于类型本身，这种属性称为类型属性
//另外，还可以定义属性观察期来监控属性值的变化，以此来触发一个自定义的操作。属性观察器可以添加到自己定义的存储属性上，也可以添加到从父类继承的属性上

//存储属性：存储在特定类或结构体实例的一个常量或变量，可以是变量存储属性（var），也可以是常量存储属性（let）
struct FixedLengthRange {
    var firstValue: Int    //实例化后可以修改
    let length: Int       //实例化后无法修改
}

var rangeOfThreeItem = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItem.firstValue = 6

//如果创建了一个结构体的实例并将其赋给一个常量，则无法修改该实例的任何属性，即使有属性被声明为变量也不行
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)      //值类型被声明为常量，其属性也无法被修改

//当值类型的实例被声明为常量的时候，它的所有属性也就成了常量
//rangeOfFourItems.firstValue = 6             //Error

//延迟存储属性：当第一次被调用的时候才会计算其初始值的属性，在属性声明前使用lazy来标示一个延迟存储属性
//延迟属性很有用，当属性的值依赖于在实例的构造过程结束后才会知道影响值得外部因素时，或者当获得属性的初始值需要复杂或大量计算时，可以只在需要的时候计算它

class DataImporter {
    //DataImporter是一个负责将外部文件中的数据导入的类，这个类的初始化会消耗不少时间
    var fileName = "data.txt"
    
    //数据导入功能
}

class DataManager {
    //延迟:需要导入功能的时候才创建
    lazy var importer = DataImporter()
    var data = [String]()
    
    //数据管理功能
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")    //importer属性还没有被创建
print(manager.importer.fileName)         //importer属性现在被创建了

//如果一个被标记为lazy的属性在没有被初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次

//计算属性不直接存储值，而是提供一个getter和一个可选的setter，间接获取和设置其他属性或者变量的值
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    //计算属性
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
        //set简化:默认值newValue
//        set {
//            origin.x = newValue.x - (size.width / 2)
//            origin.y = newValue.y - (size.height / 2)
//        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at \(square.origin.x), \(square.origin.y)")

square.origin = Point(x: 20, y: 20)
square.size = Size(width: 20.0, height: 20.0)
print("square.center is now at \(square.center.x), \(square.center.y)")

//只读计算属性：只有getter没有setter的计算属性
//计算属性只能声明成为var，因为是可变的

//只读计算属性可以去掉get关键字和{}
//三维空间立方体
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    //只读计算属性
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

//属性观察器:监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，即使新值和当前值相同的时候也不例外
//可以为除了延迟存储属性之外的其他存储属性添加属性观察器，也可以通过重写属性的方式为继承的属性(包括存储属性和计算属性)添加属性观察器

//willSet: 在新的值被设置之前调用
//didSet: 在新的值被设置之后立即调用
//父类的属性在子类的构造器中被赋值时，它在父类的willSet和didSet观察器会被调用，随后才会调用子类的观察器
class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)")    //默认值newValue
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")     //旧值默认值oldValue
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360

//全局变量和局部变量
//全局变量是在函数、方法、闭包或任何类型之外定义的变量；局部变量是在函数、方法或闭包内部定义的变量

//全局的常量或变量都是延迟计算的，不同的地方在于，全局的常量或变量不需要标记lazy修饰符
//局部范围的常量或变量从不延迟计算

//类型属性
//实例属性属于一个特定类型的属性，每创建一个实例，实例都拥有属于自己的一套属性值，实例之间的属性相互独立
//也可以为类型本身定义属性，无论创建了多少个该类型的实例，这些属性都只有唯一一份，称为类型属性
//类型属性用于定义某个类型所有实例共享的数据

//存储型类型属性必须指定默认值，因为类型本身没有构造器
//存储型类型属性是延迟初始化的，它们只有在第一次被访问的时候才会被初始化；即使它们被多个线程同时访问，系统也保证只会对其进行一次初始化，并且不需要使用lazy修饰符

//使用static关键字定义类型属性。在为类定义计算型类型属性时，可以改用关键字class来支持子类对父类的实现进行重写
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum someEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    
    //支持子类对父类进行重写
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
print(someEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)
print(SomeClass.overrideableComputedTypeProperty)

//继承计算型类型属性
class AnotherClass: SomeClass {
     override static var overrideableComputedTypeProperty: Int {
        get {
            return 127
        }
        
        set {
            storedTypeProperty = "value is \(newValue)"
        }
    }
}

let anotherClass = AnotherClass()
AnotherClass.overrideableComputedTypeProperty = 137
print("========================")
print(AnotherClass.overrideableComputedTypeProperty)

//声道模拟
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                //将当前音量限制在阈值之内
                currentLevel = AudioChannel.thresholdLevel    //不会造成属性观察器被再次调用
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                //存储当前音量作为新的最大输入音量
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(AudioChannel.maxInputLevelForAllChannels)













































