//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 析构过程（deinitialization）
 */

//析构器只适用于类类型，当一个类的实例被释放之前，析构器会被立即调用，析构器用关键字deinit来标示

//Swift通过ARC自动引用计数处理实例的内存管理，通常当实例被释放时不需要手动地去清理；但是当使用自己的资源时，可能需要进行一些额外的清理，如创建了一个自定义的类来打开一个文件，并写入了一些数据，可能需要在类实例被释放之前手动去关闭该文件

//析构器在实例释放放生前被自动调用，不能主动调用析构器
//子类继承父类的析构器，并且在子类析构器实现的最后，父类的析构器会被自动调用，即使子类没有提供自己的析构器，父类的析构器也同样会被调用

