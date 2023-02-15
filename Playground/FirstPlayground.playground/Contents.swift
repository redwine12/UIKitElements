import UIKit

var greeting = "Hello"
 
var gpa = 4.5
var bool = true

var money = 1_000_000
money = 900

var name = "jay"
var text = "my name is \(name)"

//constant
let who = "jay"
//who = "mike" // 변경 불가

// 명시적 타입 기입
var day: Int = 3
var sayhi: String = "hi"

// tuple
var computer = (os : "Mac", model : "macbookpro")

computer.0
computer.1
// computer.2    // 값 없음

// enum
// 주중의 평일을 enum으로 생성
enum week{
    case mon
    case tue
    case wed
    case thu
    case fri
}

var today : week = .mon

// 레벨 생성
enum level: Int{
    case junior
    case senior
    case master
}

var me:level = .junior
me.rawValue

let pro = level(rawValue: 2)

// 문자열 enum
enum direction: String{
    case up = "go up"
    case down = "go down"
}

var dir: direction = .down
dir.rawValue


let first = "a"
let second = "b"
let third = "c"
// 배열 선언
let arr = [first, second, third]

arr[0]
arr[1]

// Dictionary
let dic: [String: Int] = [
    "키" : 175,
    "몸무게" : 65
]

dic["키"]
dic["몸무게"]

// Set (array 성질이지만, 순서와 중복 데이터가 존재하지않음
var nums: Set<Int> = ([2, 3, 5, 7])

// 삼항 연산자
var a = 1
var b = 2
var c = a == b ? "same" : "not same"


// switch
enum Direction{
    case up
    case down
}

let directions = Direction.down

switch directions{
case .up:
    print("up")
case .down:
    print("down")
}

// for문
let range = 1...10

for num in range{
    print("num is \(num)")
}

let names = ["Kim", "Lee", "Park"]

for name in names {
    print("name is \(name)")
}

// while 문
var number = 1
while number <= 20 {
    print(number)
    number += 1
}

// break
for i in 1...10 {
    if(i == 3){
        break
    }
    print(i)
}

// continue
for i in 1...10 {
    if(i == 3){
        continue
    }
    print(i)
}


// function
func printHello() {
    print("Hello !")
}
printHello()

func printName(_ name : String){
    print("name is \(name)")
}
printName("Lee")

func twiceNum(num : Int) -> Int {
    return num+num
}
let ans = twiceNum(num: 3)
print(ans)

// function - default parameter
func discount(price : Double, ratio : Double = 0.2) -> Double {
    return price * (1-ratio)
}

let defaultDiscount = discount(price: 2000)
let customDiscount = discount(price: 2000, ratio: 0.5)

// variadic function - 여러 파라미터 받을 수 있음
func printNames(_ names: String...){
    for name in names{
        print("name is \(name)")
    }
}
printNames("Smith", "James", "Park")


// closure
//let checking = {
//    print("checking ---")
//}
//checking();

let checking = {(id: String) -> Bool in
    if id == "lee" { return true }
    else { return false }
}

let isValid = checking("lee")

// 함수 파라미터로 클로저 받기
func validate(id: String, checking: (String) -> Bool) -> Bool {
    let isValid = checking(id)
    return isValid
}

let validResult = validate(id: "lee", checking: checking)
let validResult2 = validate(id: "lee", checking: {(id: String) in
    if id == "lee" { return true }
    else { return false }
})


// struct
struct Movie{
    var name: String
}

var movie = Movie(name: "아바타2")
print(movie.name)

movie.name = "탑건" //movie name 변경
print(movie.name)

// computed property - 계산된 값을 반환

struct Information{
    // stored property
    var name: String
    var birth: Int
    
    // computed property
    var description: String{
        return "name is \(name), birth is \(birth)"
    }
}

var person = Information(name: "LeeJaeYoung", birth: 20010309)
print(person.description)
person.name
person.birth

// property observers
struct Task{
    var name: String
    var progress: Int{
        didSet {
            var str = ""
            for i in  1...10{
                if progress >= i*10 {
                    str += "*"
                }
                else{
                    str += "-"
                }
            }
            
            print("Current Progress : \(str)  \(progress)%")
        }
    }
    
    var isDone: Bool{
        return progress == 100
    }
}

var task = Task(name: "test task", progress: 0)
task.progress = 50
task.progress = 70
task.progress = 90

// method - 객체가 가지고있는 함수
struct Student{
    var name: String
    var major: String
    var knowledge: Double
    
    func didFinalTest() -> Int{
        let howMuchIDontKnow = (1-knowledge)*100
        let score = 100 - Int(howMuchIDontKnow)
        return score
    }
}

var student = Student(name: "Lee", major: "Software", knowledge: 0.5)
let score = student.didFinalTest()

// initializer
struct Phone{
    var model: String
    
    init(){
        model = "iPhone"
    }
}
let iPhone = Phone()

// 현재 객체 지칭{
struct Phone2{
    var model: String
    
    init(model: String = "iPhone2"){
        self.model = model
    }
}
let iPhone2 = Phone2()


// class
class Dog{
    var name: String
    var breed: String
    
    init(name: String, breed: String){
        self.name = name
        self.breed = breed
    }
    
    func bark(){
        print("bow wow")
    }
}
let myDog = Dog(name: "milk", breed: "Collie")
myDog.name
myDog.breed

class Collie: Dog{
    init(name: String){
        super.init(name: name, breed: "Collie")
    }
}
let dog2 = Collie(name: "mori")
dog2.name
dog2.breed
dog2.bark()

// final class - 클래스 상속을 허용하지 않아야 할때

// deinitializer
class Human {
    var name: String
    
    init(name: String){
        self.name = name
        print("initialize instance")
    }
    
    deinit {
        print("deinitialize instance: \(name)")
    }
    
    func printName(){
        print("my name: \(self.name)")
    }
}

// mutability
// class는 reference type이므로 변수 변경가능
// 그러므로 따로 mutating 키워드가 필요하지 않음



// 프로토콜 protocal - 역할 또는 약속 을 정하는 것
// 프로토콜 선언
protocol SchoolClass{
    var name: String {get}
    var className: String {get}
    
    func sayHello()
}

// 위에서 선언한 프로토콜 채택
struct UnivPresidentStudent: SchoolClass {
    var name: String
    var className: String
    
    func sayHello() {
        print("hi, professor")
    }
}

struct HighStudent: SchoolClass{
    var name: String
    var className: String
    
    func sayHello() {
        print("hi, teacher")
    }
}



