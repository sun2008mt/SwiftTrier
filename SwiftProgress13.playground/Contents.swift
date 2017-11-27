//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 在Swift中，继承时区分类和其他类型的一个基本特征；类可以调用和访问超类的方法、属性和下标，并且可以重写这些方法、属性和下标来优化或修改它们的行为
 */

//基类: Swift中的类并不是从一个通用的基类继承而来

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

//子类:在一个已有类的基础上创建一个新的类
class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

//子类可以继续被其他类继承
class Tandem: Bicycle {      //双人自行车
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

//重写(override): 子类可以为继承来的实例方法、类方法、实例属性或下标提供自己定制的实现

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

//可以将一个继承来的只读属性重写为一个读写属性，只需要在重写版本的属性里提供getter和setter即可；但是，不能将一个继承来的读写属性重写为一个只读属性
class Car: Vehicle {
    //当前档位
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

//不可以为继承而来的常量存储型属性或者只读计算型属性添加属性观察器，因为这些属性的值是不可以被设置的，所以为它们提供willSet或didSet实现是不恰当的
//不可以同时提供重写的setter和重写的属性观察器，因为在setter中便可以观察到任何值变化了

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

//防止重写:通过把方法、属性或下标标记为final来防止它们被重写，只需要在声明关键字前加上final修饰符即可
//final var, final func, final class func, final subscript

//在类扩展中的方法，属性或下标也可以在扩展的定义里标记为final
//通过在关键字class前添加final修饰符(final class)来将整个类标记为final，这样的类是不可以被继承的






































