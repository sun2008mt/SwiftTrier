//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 方法(Methods)
 */

//类、结构体和枚举都可以定义实例方法：实例方法为给定类型的实例封装了具体的任务与功能
//类、结构体和枚举也可以定义类型方法：类型方法与类型本身相关联

//实例方法
class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
print(counter.count)
counter.increment()
print(counter.count)
counter.increment(by: 5)
print(counter.count)
counter.reset()

//self属性：类型的每一个实例都有一个隐含属性叫做self，self完全等同于该实例本身

struct Point {
    var x = 0.0, y = 0.0
    
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x    //参数名比属性名享有优先权
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

struct PointStruct {
    var x = 0.0, y = 0.0
    
    //默认情况下，值类型的属性不能再实例方法中被修改，想修改的化需要加上mutating关键字
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
        
        //隐藏属性self，改变了属性值本质上是给self一个全新的实例
//        self = PointStruct(x: self.x, y: self.y)
    }
}

var somePointStruct = PointStruct(x: 1.0, y: 1.0)
somePointStruct.moveByX(deltaX: 2.0, y: 3.0)
print("The pointStruct is now at (\(somePointStruct.x), \(somePointStruct.y))")

var anotherPointStruct = PointStruct(x: 2.0, y: 2.0)
anotherPointStruct.x = 3.0
anotherPointStruct.y = 3.0
print("The anotherPointStruct is now at (\(anotherPointStruct.x), \(anotherPointStruct.y))")

//在可变方法中给self赋值
//可变方法能够赋给隐含属性self一个全新的实例

//枚举的可变方法可以把self设置为同一枚举类型中的不同成员
enum TriStateSwitch {
    case Off, Low, High
    
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}

var highSwitch = TriStateSwitch.High
var lowSwitch = TriStateSwitch.Low
var offSwitch = TriStateSwitch.Off

print(lowSwitch)
lowSwitch.next()
print(lowSwitch)
lowSwitch.next()
print(lowSwitch)
lowSwitch.next()
print(lowSwitch)

//类型方法：使用关键字static，类可以使用关键字class来允许子类重写父类的方法实现
class SomeClass {
    class func someTypeMethod() {
        print("SomeClass, someTypeMethod")
    }
}

SomeClass.someTypeMethod()

//在类型方法的方法体中，self指向这个类型本身，而不是类型的某个实例
//可以用self来消除类型属性和类型方法参数之间的歧义
//一个类型方法可以直接通过类型方法的名称调用本类型中的其他类型方法，而无需在方法名称前面加上类型名称

//检测玩家已解锁的最高等级
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
//    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Marc")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

var player2 = Player(name: "Bob")
if player2.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlock")
}

player.complete(level: 6)
if player2.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlock")
}




























