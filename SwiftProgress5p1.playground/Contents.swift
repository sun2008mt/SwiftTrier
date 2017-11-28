//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 控制流(Control Flow): Part1循环
 */

//For-In循环
for index in 1...5 {
    print("(\(index) times 5 is \(index * 5))")
}

//如果不需要区间序列内每一项的值，可以使用_替代变量名
let base = 3
let power = 10
var answer = 1

for _ in 1...power {      //_能够忽略当前值，并且不提供循环遍历时对值得访问
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

//while循环
//Chutes and Ladders
let finalSquare = 25
var board = Array(repeating: 0, count: finalSquare + 1)    //包括起点在内有26格(0~25)
board[3] = +08; board[6] = +11; board[9] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08    //补0是为了让代码更整洁

var square = 0
var diceRoll = 0
var round = 0

while square < finalSquare {
    //掷骰子
    diceRoll = Int(arc4random_uniform(6)) + 1
    print("==================================")
    print("当前在第\(square)格")
    print("骰子值为: \(diceRoll)")
    
    //根据点数移动
    square += diceRoll
    if square < board.count {
        //如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去(没有梯子或蛇保持不变)
        square += board[square]
    }
    
    round += 1
    print("当前在第\(square)格")
}

print("==================================")
print("完成游戏!总共用了\(round)轮")

print("Repeat-While版本")
//Repeat-While
square = 0
diceRoll = 0
round = 0

repeat {
    print("==================================")
    print("当前在第\(square)格")
    print("骰子值为: \(diceRoll)")
    //顺着梯子爬上去或者顺着蛇滑下去
    square += board[square]
    //掷骰子
    diceRoll = Int(arc4random_uniform(6)) + 1
    //根据点数移动
    square += diceRoll

} while square < finalSquare

