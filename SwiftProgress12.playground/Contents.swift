//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 下标(Subscripts)
 */

//下标可以定义在类、结构体和枚举中，是访问集合、列表或序列中元素的快捷方式
//一个类型可以定义多个下标，通过不同索引类型进行重载
//定义下标使用subscript关键字，指定一个或多个输入参数和返回类型;与实例方法不同的是，下标可以设定为读写或只读

struct TimesTable {
    let multiplier: Int
    
    //只读下标
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

//一个类或结构体可以根据自身需要提供多个下标实现，使用下标时将通过入参的数量和类型进行区分，自动匹配合适的下标，这就是下标的重载

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        //初始化数组，默认值为0.0
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    //接受两个入参的构造方法
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        
        set {
            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

//let someValue = matrix[2, 2]      //assertion将触发，超出Matrix的范围









































