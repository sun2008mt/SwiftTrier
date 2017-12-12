//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 构造过程(initialization)
 */

//构造过程是使用类、结构体或枚举类型的实例之前的准备过程，通过定义构造器来实现构造过程，Swift的构造器无需返回值；类的实例也可以通过定义析构器在实例释放之前执行特定的清除工作

//存储属性的初始赋值：类和结构体在创建实例时，必须为所有存储型属性设置合适的初始值，存储型属性的值不能处于一个未知的状态

//当你为存储型属性设置默认值或者在构造器中为其赋值时，它们的值时被直接设置的，不会触发任何属性观察器

//构造器
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature) Fahrenheit")


//默认属性值：可以在属性声明时为其设置默认值
//如果一个属性总是使用相同的初始值，那么为其设置一个默认值比每次都在构造器中赋值要好。两种方法的效果是一样的，不过使用默认值让属性的初始化和声明结合得更紧密。使用默认值能让你的构造器更简洁、更清晰，且能通过默认值自动推导出属性的类型；同时，它也能让你充分利用默认构造器、构造器继承等特性
struct Fahrenheit2 {
    var temperature = 32.0
}

//自定义构造过程

//构造参数
struct Celsius {             //摄氏温度
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {            //华氏温度
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {            //开氏温度
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfwater = Celsius(fromKelvin: 273.15)

//参数的内部名称和外部名称：通过构造器中的参数名和类型来确定应该被调用的构造器
//如果在定义构造器时没有提供参数的外部名字，Swift会为构造器中的每个参数自动生成一个跟内部名字相同的外部名
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//不带外部名的构造器参数：使用_来显式地描述构造器的外部名
struct Person {
    var name: String
    init(_ name: String) {
        self.name = name
    }
}
let person = Person("Marc")

//可选属性类型
//可选属性逻辑上允许取值为空，可选类型的属性将自动初始化为nil
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()

//构造过程中常量属性的修改:一旦常量属性被赋值，它将永远不可更改
//对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改，不能在子类中修改

//默认构造器：如果结构体或类的所有属性都有默认值，同时没有自定义的构造器，那么Swift会给这些结构体或类提供一个默认构造器，这个默认构造器将简单地创建一个所有属性值都设置为默认值的实例
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

//结构体的逐一成员构造器：如果结构体没有提供自定义的构造器，它们将自动获得一个逐一成员构造器，即使结构体的存储属性没有默认值
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

//值类型的构造器代理
//构造器代理的实现规则和形式在值类型和类类型中有所不同。值类型（结构体和枚举）不支持继承，所有构造器代理的过程相对简单，因为它们只能代理给自己的其他构造器；类则不同，他可以继承其他类，意味着类有责任保证其所有继承的存储型属性在构造时也能正确的初始化

//对于值类型，可以使用self.init在自定义的构造器中引用相同类型中的其他构造器，并且你只能在构造器内部调用self.init

//如果你为某个值类型定义了一个自定义的构造器，你将无法访问到默认构造器（如果是结构体，还将无法访问逐一成员构造器）
//如果你希望默认构造器，逐一成员构造器以及你自己的自定义构造器都能用来创建实例，可以将自定义的构造器写到扩展(extension)中，而不是写在值类型的原始定义中
struct Size2 {
    var width = 0.0, height = 0.0
}

struct Point2 {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point2()
    var size = Size2()
    init() {}
    
    init(origin: Point2, size: Size2) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point2, size: Size2) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        //代理构造器
        self.init(origin: Point2(x: originX, y: originY), size: size)
    }
}

//类的继承和构造过程
//类里面的所有存储属性，包括所有继承自父类的属性，都必须在构造过程中设置初始值

//指定构造器和便利构造器
//指定构造器时类中最主要的构造器，一个指定构造器将初始化类中提供的所有属性，并根据父类链往上调用父类的构造器来实现父类的初始化
//每个类都必须拥有至少一个指定构造器

//便利构造器是类中比较次要的、辅助型的构造器，可以定义便利构造器来调用同一个类中的指定构造器，，并为其参数提供默认值，便利构造器需要在init关键字前放置convenience关键字

//类的构造器代理规则
//1.指定构造器必须调用其直接父类的指定构造器
//2.便利构造器必须调用同类中定义的其他构造器
//3.便利构造器必须最终导致一个指定构造器被调用

//指定构造器必须总是向上代理，便利构造器必须总是横向代理

//两段式构造过程：Swift中的类的构造过程包含两个阶段。第一个阶段，每个存储型属性被引入它们的类指定一个初始值。当每个存储型属性的初始值被确定后，第二阶段开始，它给每个类一次机会，在新实例准备使用之前进一步定制它们的存储型属性

//一个对象的内存只有在其所有存储型属性确定之后才能完全初始化

//为确保两段式构造过程能不出错地完成，Swift编译器将执行4种有效的安全检查：
//1.指定构造器必须保证它所在类引入的所有属性都必须先初始化完成，之后才能将其他构造任务向上代理给父类中的构造器
//2.指定构造器必须先向上代理调用父类构造器，然后再为继承的属性设置新值。如果没有这么做，指定构造器赋予的新值将被父类中的构造器所覆盖
//3.便利构造器必须先代理调用同一类中的其他构造器，然后再为任意属性赋新值。如果没有这么做，便利构造器赋予的新值将被同一类中的其他指定构造器所覆盖
//4.构造器在第一阶段构造完成之前，不能调用任何实例方法，不能读取任何实例属性的值，不能引用self作为一个值

//构造器的继承和重写

//跟Objective-C中的子类不同，Swift中的子类默认情况下不会继承父类的构造器。Swift的这种机制可以防止一个父类的简单构造器被一个更精细的子类继承，并被错误地用来创建子类的实例

//重写父类构造器需要使用override关键字,当重写一个父类的指定构造器时，总是需要写override修饰符，即使是将父类的指定构造器重写为便利构造器;然而在“重写”一个父类便利构造器时，不需要加override前缀
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheels"
    }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.numberOfWheels) wheels")

//子类可以在初始化时修改继承来的变量属性，但是不能修改继承来的常量属性

//构造器的自动继承
//默认情况下，子类不会继承父类的构造器

//1.如果子类没有定义任何指定构造器，会自动继承所有父类的指定构造器
//2.如果子类提供了所有父类指定构造器的实现，无论是通过上条规则继承过来，还是提供了自定义实现，它将自动继承所有父类的便利构造器
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")

//会自动继承父类的便利构造器
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

//会自动继承父类的所有指定构造器和便利构造器
class ShoppingListItem2: RecipeIngredient {
    var purchased = false        //默认初始值
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ?" : " ?"
        return output
    }
}

var breakfastList = [
ShoppingListItem2(),
ShoppingListItem2(name: "Bacon"),
ShoppingListItem2(name: "Eggs", quantity: 6)
]

breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

//可失败构造器：如果一个类、结构体或枚举类型的对象，在构造过程中有可能失败，则为其定义一个可失败构造器。“失败”是指，如给构造器传入无效的参数值，或缺少某种所需的外部资源，又或是不满足某种必要的条件等
//可失败构造器语法：init?
//可失败构造器的参数名和参数类型，不能与其非可失败构造器的参数名及参数类型相同

//可失败构造器会创建一个类型为自身类型的可选类型的对象，通过return nil语句来表明可失败构造器在何种情况下应该“失败”

//严格来说，构造器都不支持返回值，因为构造器本身的作用只是为了确保对象能被正确构造。因此你只是用return nil表明可失败构造器构造失败，而不要用关键字return来表明构造成功

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {return nil}
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")   //someCreature的类型是Animal?而不是Animal

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")
print(anonymousCreature == nil)

//""空字符串是一个有效的，非可选类型的字符串

//枚举类型的可失败构造器
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
let unknownUnit = TemperatureUnit(symbol: "X")

//带原始值的枚举类型的可失败构造器
//带原始值的枚举类型会自带一个可失败构造器init?(rawValue)

enum TemperatureUnit2: Character {
    case Kelvin = "K", Celsius = "C", Fahrenhei = "F"
}
let fahenheitUnit2 = TemperatureUnit2(rawValue: "F")    //和原始值匹配

//构造失败的传递：子类的可失败构造器也能向上代理到父类的可失败构造器
//可失败构造器也可以代理到其他的非可失败构造器，通过这种方式，你可以增加一个可能的失败状态到现有的构造过程中























