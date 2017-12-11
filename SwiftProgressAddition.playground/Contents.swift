//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//排序
let array = [23, 45, 12, 89, 98, 55, 7]
let sortedArray = array.sorted(by: {
    (one: Int, two: Int) -> Bool in
        return one < two
})
print(sortedArray)

array.sorted(by: {(one, two) in one < two})
array.sorted(by: {one, two in one < two})
array.sorted(by: {$0 < $1})
array.sorted(by: <)

let array2 = [3, 2, 1]
print(array2.sorted())

//过滤
let filteredArray = array.filter { $0 > 50 }
print(filteredArray)

//映射
let mappedArray = array.map { $0 % 10 }
print(mappedArray)

//归约
let reducedRes = array.reduce(0, +)
print(reducedRes)

let reducedRes2 = array.reduce(0, -)
print(reducedRes2)

let reducedRes3 = array.reduce(0, *)
print(reducedRes3)

let reducedRes4 = array.reduce(1, +)
print(reducedRes4)
