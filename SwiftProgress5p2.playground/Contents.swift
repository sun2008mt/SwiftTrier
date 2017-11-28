//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 控制流：Part2条件语句
 */

//If ... else ...
var temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm.Don't forget to wear sunscreen.")
}

//Switch ... case ...
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabel")
default:
    print("Some other character")
}

//在Swift中，当匹配的case分支中的代码执行完毕后，程序会终止switch语句，而不会继续执行下一个case分支，因此不需要在case分支中显示地使用break语句,不存在隐式地贯穿
//每一个case分支都必须包含至少一条语句

//复合匹配
let anotherCharacter: Character = "A"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

//匹配区间
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100 ..< 1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings)")

//使用元组:使用元组在同一个switch语句中测试多个值，元组中的元素可以是值，也可以是区间;使用_来匹配所有可能的值
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
default:
    print("(\(somePoint.0), \(somePoint.1) is outside of the box)")
}

//在Swift中，允许多个case匹配同一个值；如果存在多个匹配，只会执行第一个被匹配到的case分支

//值绑定(Value Binding)
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y)")
}

//where语句判断额外条件
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:          //动态过滤器
    print("(\(x), \(y) is on the line x == y)")
case let (x, y) where x == -y:
    print("(\(x), \(y) is on the line x == -y)")
case let (x, y):
    print("(\(x), \(y) is just some arbitrary point)")
    
}

//复合匹配同样可以包含值绑定，不过复合匹配里所有的匹配模式，都必须包含相同的值绑定
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

//控制转移语句：改变代码的执行顺序，实现代码的跳转
//continue, break, fallthrough, return throw

//Continue语句：告诉一个循环体立刻停止本次循环，重新开始下次循环，但是并不会离开整个循环体
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

//Break语句：立刻结束整个控制流的执行

//当在一个循环体中使用break时，会立刻中断该循环体的执行，然后跳转到表示循环体结束的大括号}后的第一行代码，不会再有本次循环的代码被执行，也不会再有下次循环产生
//当在一个switch代码中使用break时，会立即中断该switch代码块的执行，并且跳转到表示switch代码块结束的大括号}后的第一行代码

//贯穿：如果需要C风格的贯穿的特性，可以在每个需要该特性的case分支中使用fallthrough关键字
let integerToDescrible = 5
var description = "The number \(integerToDescrible) is"
switch integerToDescrible {
case 2,3,5,7,11,13,17,19:
    description += " a prime number, and also"
    fallthrough
default:
    description += "an integer"
}
print(description)
//fallthrough关键字不会检查它下一个将会落入执行的case中的匹配条件。fallthrough简单地使代码继续连接到下一个case中的代码，和C语言标准中的switch语句特性是一样的

//带标签的语句:在Swift中，你可以在循环体和条件语句中嵌套循环体和条件语句来创造复杂的控制流结构；并且，循环体和条件语句都可以使用break语句来提前结束整个代码块。使用标签来标记一个循环体或者条件语句

let finalSquare = 25
var board = Array(repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
var round = 0

gameLoop: while square != finalSquare {
    diceRoll = Int(arc4random_uniform(6)) + 1
    round += 1
    
    print("第\(round)轮=======================")
    print("当前位置：第\(square)格")
    print("骰子点数：\(diceRoll)")
    
    switch square + diceRoll {
    case finalSquare:
        //骰子数刚好使玩家移动到最终的方格里，游戏结束
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        //骰子数将会使玩家的移动超出最后的方格，这种移动是不合法的，玩家需要重新掷骰子
        continue gameLoop
    default:
        //合法移动，做正常处理
        square += diceRoll
        square += board[square]
    }
}
print("=======================")
print("当前位置：第25格")
print("完成游戏,总共用了\(round)轮")

//如果上述的break语句没有使用gameLoop标签，那么它将会中断switch语句而不是while循环，使用gameLoop标签清晰地表明了break想要中断的是哪个代码块；而continue gameLoop则不会有歧义，因为在代码中只有一个循环体，但是使用标签会更加清晰明了

//提前退出：使用guard语句要求条件必须为真时，以执行guard语句后的代码，一个guard语句后面总是有一个else从句
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location)")
}
greet(person: ["name": "John"])

//如果guard语句的条件被满足，则继续执行guard语句大括号后的代码；如果条件不被满足，在else分支上的代码就会被执行，这个分支必须转移控制以退出guard语句出现的代码段

//相比于可以实现同样功能的if语句，按需使用guard语句会提升代码的可读性。guard可以使你的代码连贯地被执行而不需要将它包含在else块中，可以使你在紧邻条件判断的地方，处理违规的情况

//使用if版本
func fooManualCheck(x: Int?) {
    if x == nil || x! <= 0 {
        return
    }
    
    x!.description
}

//使用可选绑定版本(swift3.0之后可选绑定where子句用,代替)
func fooBinding(x: Int?) {
    if let temp = x, temp > 0 {
        temp.description
    }
}

//使用guard版本
func fooGuard(x: Int?) {
    guard let temp = x, temp > 0 else {
        return
    }
    
    temp.description
}

//检测API可用性
if #available(iOS 11, macOS 10.13, watchOS 11, tvOS 11, *) {
    //使用最新版本的API
    print("Available")
} else {
    //使用先前版本的API
    print("Unavailable")
}
















