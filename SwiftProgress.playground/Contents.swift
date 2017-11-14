//: Playground - noun: a place where people can play

/*
 * The Basics
 */

import UIKit

//Constants and Variables
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0, z = ""
let a = 0.0, b = 0, c = ""



//Type Annotations类型标注 (colon: 冒号)
var welcomeMessage: String      //... of type ...
//Declare a variable called welcomeMessage that is of type String
welcomeMessage = "Hello"

//define multiple related variables
var red, green, blue: Double

//定义之后无法再定义相同名字的变量，也不能改变变量的类型以及将变量变成常量
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

let `let` = "using  keywords as names"

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "Swift"
//languageName = "Swift++"   //Error



//Printing Constants and Variables
print(friendlyWelcome)        //global function
print("abcdefghijklmn", separator: "|", terminator: "\n")

//string interpolation字符串插值（parenthesis：括号， blackslash：反斜杠）
print("the current value of friendlyWelcome is \(friendlyWelcome)")



//Comments
//This is a comment

/* This is also a comment
    but is written over multiple lines */

/* THis is the start of the first multiline comment
    /* This is the second, nested multiple comment. */
    This is the end of the first multiple comment.
 */



//Semicolons(分号)
let cat = "🐈"; print(cat)



//Integers (fractional：分数的，小数的)
//signed integers(positive, zero or negative)
//unsigned integers(positive or zero)



//Integer Bounds
let minValue = UInt8.min
let maxValue = UInt8.max



//Int and UInt
//Int has the same size as the current platform's native word size:
//On a 32-bit platform, Int is the same size as Int32
//On a 64-bit platform, Int is the same size as Int64
//Using Int aids code consistency(一致性) and interoperability(互操作性)



//Floating-Point Numbers
//Double has a precision of at least 15 decimal digits, whereas the precision of Float can be as little as 6 decimal digits.



//Type Safety and Type Inference(类型推断)(deduce: 推理，推断)
//A literal value is a value that appears directly in your source code, such as 42 and 3.14159
let meaningOfLife = 42
let pi = 3.14159
let anotherPi = 3 + 0.14159   //inferred to be of type Double



//Numeric Literals数值型字面量
let decimalInteger = 17
let binaryInteger = 0b10001
let octalIntger = 0o21
let hexadecimalInteger = 0x11

let num = 1.25e2     //of type Double, 125
let num2 = 1.25e-2   //0.0125

let num3 = 0xFp2   //of type Double, 60.0
let num4 = 0xFp-2    //3.75

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0   //?

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1



//数值类型转换
//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)



//整数和浮点数转换(Swift类型非常严格)
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine
let integerPi = Int(pi2)        //浮点值被截断



//Type Aliases类型别名
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min



//布尔值
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm. tasty turnips")
} else {
    print("Eww, turnips are horrible")
}

let i = 1
//if i {}



//元组:把多个值组合成一个复合值，元组内的值可以是任意类型的
let http404Error = (404, "Not Found")
//分解元组
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

//分解一部分
let(justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

//命名元组元素
let http200Status = (statusCode: 200, descripiton: "OK")

//通过下标访问
print("The status code is \(http200Status.0)")
print("The status message is \(http200Status.1)")

//通过元素名称访问
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.descripiton)")

//元组在临时组织值得时候很有用，但并不适合创建复杂的数据结构



//可选类型（Optional）
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)     //Optional<Int>
print(type(of: convertedNumber))



//nil表示没有值,不能用于非可选的常量和变量(OC里面nil是一个指向不存在对象的指针，而swift中nil是一个确定的值，用来表示缺失)
var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String?       //自动被设置成为nil
print(surveyAnswer as Any)

var int2: Int!      //自动被设置为nil
print(int2)

if convertedNumber != nil {
    print("convertedNumber contains some integer value")
}

//强制解析(forced unwrapping):确定可选类型确实包含值之后，在名字后面加"!"来获取值
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber)")
}



//可选绑定(optional binding)：判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量
if let actualNumber = Int(possibleNumber) {
    print("success, \(actualNumber)")
} else {
    print("failure")
}



//隐式解析可选类型(String!),相当于可以自动解析的可选类型
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString

if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString {
    print(definiteString)
}



//错误处理Error Handling
class MyError: Error {
    public static let error1 = "ERROR1"
    public let error2 = "ERROR2"
    
    init() {
        
    }
}

func canThrowAnError() throws {
    print("error test")
    throw MyError()
}

try?canThrowAnError()

do {
    try canThrowAnError()
} catch {
    print("Error!")
}



//断言assertion
let age = 3
assert(age >= 0, "age bigger than 0")

print("assertion success")
//当条件可能为假时使用断言，但最终一定要保证条件为真，程序才能继续运行下去






















