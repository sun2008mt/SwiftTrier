//: Playground - noun: a place where people can play

/*
 * 
 */

import UIKit

var str = "Hello, playground"

//字符串字面量
let someString = "Some string literal value"



//多行字符串
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
print(singleLineString)
print(multilineString)

//反斜杠在多行字符串中不会显示在最后输出中，只是标志作用，便于阅读
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print(softWrappedQuotation)

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
print(lineBreaks)

let quotation = """
   aaaaaaa
 bbbbbb
 cccc
 ddd
 ee
 f
 """
print(quotation)



//转义字符
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"
print(wiseWords)
print(dollarSign)
print(blackHeart)
print(sparklingHeart)

let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""
print(threeDoubleQuotes)



//初始化成为空字符串
var emptyString = ""
var anotherEmptyString = String()
var nilString:String? = nil



//检查字符串是否为空
if emptyString.isEmpty {      //调用了isEmpty方法说明了变量不是nil
    print("nothing to see here")
}



//字符串可变性 (string concatenation字符串串联)
var variableString = "Horse"    //变量可变，但常量不可变
variableString += " and carriage"
print(variableString)



//字符串是值类型
//任何情况下，都会对已有字符串创建新副本，并对该新副本进行传递或赋值操作



//使用字符
for character in "Dog!?" {
    print(character)
}

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
print(catCharacters, separator: "|", terminator: "?")     //结尾符号没有使用换行



//字符串连接和字符连接等concatenate
let string1 = "hello ", string2 = "there"
var welcome = string1 + string2
print(welcome)

var instruction = "look over "
instruction += string2
print(instruction)

let exclamationMark: Character = "!"
welcome.append(exclamationMark)
print(welcome)

//Character对象只能包含一个字符，String对象是多个Character对象的集合

let badStart = """
one
two
"""        //没有换行符
let end = """
three
"""

let goodStart = """
one
two

"""       //最后换行
print(badStart + end)
print(goodStart + end)



//String interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(message)
//carriage return回车符



//Unicode Scalars标量：对应字符或者修饰符的唯一的21位数字
//behind the scenes在幕后
//U+0000 ~ U+D7FF



//Extended Grapheme Clusters可扩展的字形群集
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"
print(eAcute)
print(combinedEAcute)

//单一或组合
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
print(precomposed)
print(decomposed)

//包围符号
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
print(enclosedEAcute)

//组合成特殊符号
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
print(regionalIndicatorForUS)



//计算字符数量(count属性只是字符元素的个数，而每个元素占用内存空间等不一定是相同的)
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

let catCharacter = "🐈"
print(catCharacters.count)         //5

let blankCharacter = "          "
print(blankCharacter.count)        //10

print("中国".count)               //2
print("爱".count)                //1

//组合后字符数量可能保持不变
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"

//通过characters属性返回的字符数量并不总是与包含相同字符的NSString的length属性相同。NSString的length属性是利用UTF-16表示的16位代码单元数字，而不是Unicode可扩展的字符群集



//Accessing and Modifying a String
//不同的字符可能会占用不同数量的内存空间，所以要知道Character的确定位置，必须从String开头遍历每一个Unicode标量直到结尾；因而，Swift的字符串不能用整数做索引
let greeting = "Guten Tag!"
var temp = greeting[greeting.startIndex]
print("\(temp), and type of temp is \(type(of: temp))")

greeting[greeting.index(before: greeting.endIndex)]    //!

greeting[greeting.index(after: greeting.startIndex)]    //u

let index = greeting.index(greeting.startIndex, offsetBy: 7)     //a

//greeting[greeting.endIndex]          //Error, 超出了字符串
print(type(of: greeting.endIndex))      // greeting.endIndex是Index类型，不是Int类型

//使用字符串的indices属性会创建一个包含全部索引的范围，用来在一个字符串中范文单个字符
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}



//inserting and removing
var welcome2 = "hello"
welcome2.insert("!", at: welcome2.endIndex)
print(welcome2)

welcome2.insert(contentsOf: " there", at: welcome2.index(before: welcome2.endIndex))
print(welcome2)

welcome2.remove(at: welcome2.index(before: welcome2.endIndex))
print(welcome2)

let range = welcome2.index(welcome2.endIndex, offsetBy: -6) ..< welcome2.endIndex
print(type(of: range))       //Range<Index>类型
welcome2.removeSubrange(range)
print(welcome2)



//SubStrings
//SubStrings和String是两种类型，但是很多方法是相通的
let greetingStr = "Hello, world"
let index2 = greetingStr.index(of: ",") ?? greetingStr.endIndex
let beginning = greetingStr[..<index2]
print(beginning)



//Comparing Strings(character equality, prefix equality and suffix equality)
let quotation2 = "We're a lot alike, you and I"
let sameQuotation2 = "We're a lot alike, you and I"
if quotation2 == sameQuotation2 {
    print("These two strings are considered equal")
}

//如果两个字符串的可扩展字形群集是标准相等的，就认为他们是相等的。即使可扩展的字形群集是由不同的Unicode标量构成，只要它们有同样的语言意义和外观，就认为他们标准相等
// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"

//另一种情况，不同语言中的相同字符（英语中的U+0041，或者A，和俄语中的U+0410,或者A），看起来是一样的，却是不同的语言意义
let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
print(latinCapitalLetterA)
print(cyrillicCapitalLetterA)

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}



//Prefix and Suffix Equality
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")



//Unicode Representations of Strings
let dogString = "Dog‼🐶"
print(dogString.count)

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print()
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print()
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print()
for scalar in dogString.unicodeScalars {
    print("\(scalar) ", terminator: "")
}




















