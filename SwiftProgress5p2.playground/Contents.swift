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
case :
    
default:
    
}








































