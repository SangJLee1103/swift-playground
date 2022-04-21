import UIKit


//구조체, 클래스
//클래스의 기능범위 > 구조체의 기능범위
//클래스는 상속, 타입캐싕, 소멸화구문, 참조에 의한 전달을 할 수 있다.

//구조체와 클래스 예시

struct Resolution {
    var width = 0 //프로퍼티 or 멤버변수라 함
    var height = 0
    
    // 인스턴스 메소드 - 클래스, 구조체, 열거형과 같은 객체 타입이 만들어 내는 인스턴스에 소속된 함수
    func desc() -> String{
        return "Resolution 구조체"
    }
}

class VideoMode{
    var interlaced = false
    var frameRate = 0.0
    var name : String? //옵셔널-> 초기값 nil로 저장
    
    var res = Resolution()
    
    func desc() -> String {
        return "VideoMode 클래스"
    }
}

//인스턴스 생성
let insRes = Resolution()
let insVMode = VideoMode()


//인스턴스의 속성에 접근
let width = insRes.width
print("insRes 인스턴스의 width 값은 \(width)")
print("insVMode 인스턴스의 width 값은 \(insVMode.res.width)") //서브 프로퍼티에 접근

insVMode.res.height = 100 //체인 형태: swift에서는 지원하지만 objective-C에서는 지원하지 않음
print("insVMode 인스턴스의 height 값은 \(insVMode.res.height)") //서브 프로퍼티에 접근


//멤버와이즈 초기화 구문
let defaultRes = Resolution(width: 1024, height: 768)
print("width:\(defaultRes.width), height:\(defaultRes.height)")


//구조체의 값 전달 방식 -> 구조체는 인스턴스를 생성한 후 이를 변수나 상수에 할당하거나 함수의 인자값으로 전달할 때 값을 복사하여 전달하는 방식을 사용

//스위프트에서 모든 구조체는 값 타입
//구조체 인스턴스를 변수에 대입하면 기존의 인스턴스가 그대로 대입되는 것이 아닌 이를 복사한 새로운 값이 대입

let hd = Resolution(width: 1920, height: 1080)
//hd.width = 10 //인스턴스가 상수에 할당되어 있으므로 멤버변수의 값을 변경할 수 없음

var cinema = hd //대입 시점에 기존 인스턴스의 복사본이 만들어지고 그것이 cinema에 대입됨 따라서 hd와 cinema는 별개의 인스턴스가 대입되어 있음

cinema.width = 2048

print("cinema 인스턴스의 width 값은 \(cinema.width)")
print("hd 인스턴스의 width 값은 \(hd.width)")



//클래스의 값 전달 방식 -> 메모리 주소 참조에 의한 전달(포인터 느낌)
let video = VideoMode()
video.name = "Original Video Instance"
print("video 인스턴스의 name 값은 \(video.name!)")

let dvd = video
dvd.name = "DVD Video Instance"
print("video 인스턴스의 name 값은 \(video.name!)")


//함수의 인자값 타입 -> VideoMode 와 Resolution 과 같은 클래스 혹은 구조체를 새로운 자료형으로 사용 가능
func changeName(v: VideoMode) {
    v.name = "Function Video Instance"
}

changeName(v: video)
print("video 인스턴스의 name 값은 \(video.name!)")



//!! 클래스는 참조 타입이어서 메모리 관련 이슈가 있다. 인스턴스 참조관계를 막 해제해 버리거나 이 밖에 일어나는
// 참조로 인한 오류 때문에 objective-C에서 제공하지 않았던 ARC(Auto Reference Counter)를 통해 클래스 인스턴스를 참조하는 곳이 몇 군데인지
// 자동으로 카운트해주는 객체를 도입하여 참조 카운트가 0이되면 메모리 해제 대상으로 간주하여 적절히 메모리를 해제해준다.


//인스턴스 비교 ===, !==

if (video === dvd) {
    print("video와 dvd는 동일한 VideoMode 인스턴스를 참조함")
}else {
    print("video와 dvd는 서로 다른 VideoMode 인스턴스를 참조함")
}

let vs = VideoMode()
let ds = VideoMode()

if (vs === ds) {
    print("vs와 ds는 동일한 VideoMode 인스턴스를 참조함")
}else {
    print("vs와 ds는 서로 다른 VideoMode 인스턴스를 참조함")
}


//구조체 사용조건(하나라도 충족하면 사용) -> 해당하지 않을 경우 클래스 사용
/*
    1. 서로 연관된 몇개의 기본 데이터 타입들을 캡슐화하여 묶는 것이 목적일 때
    2. 캡슐화된 데이터에 상속이 필요하지 않을 때
    3. 캡슐화된 데이터를 전달하거나 할당하는 과정에서 참조 방식보다는 값이 복사되는 것이 합리적일 때
    4. 캡슐화된 원본 데이터를 보존해야 할 때
*/


//프로퍼티
/*저장 프로퍼티
    - 입력된 값을 저장하거나 저장된 값을 제공하는 역할
    - 상수 및 변수를 사용해서 정의 가능
    - 클래스와 구조체에서는 사용이 가능하지만, 열거형에서는 사용할 수 없음
*/
  
/*연산 프로퍼티
    - 특정 연산을 통해 값을 만들어 제공하는 역할
    - 변수만 사용해서 정의 가능
    - 클래스, 구조체, 열거형 모두에서 사용 가능
*/


//저장 프로퍼티 -> 클래스 내에서 선언된 변수나 상수를 부르는 이름


//초기화 구문을 정의하고 저장 프로퍼티를 초기화 해야함
//class User{
//    var name: String
//}


//해결방법1. 초기화 구문 작성 및 그 안에서 초기값 할당
class User {
    var name: String
    
    init(){ //초기화 메소드
        self.name = ""
    }
}

//해결방법2. 프로퍼티를 옵셔널 타입으로 바꿈
class User1 {
    var name: String?
    
}

class User2 {
    var name: String!
    
}

//해결방법3. 프로퍼티에 초기값을 할당.
class User3{
    var name: String = ""
}


//저장 프로퍼티의 분류

//1. var 키워드로 정의되는 변수형 저장 프로퍼티(멤버 변수)
//2. let 키워드로 정의되는 상수형 저장 프로퍼티(멤버 상수)

//고정 길이 범위 구조체
struct FixedLengthRange{
    var startValue: Int
    let length: Int
}

//가변 길이 범위 구조체
struct FlexibleLengthRange{
    let startValue: Int
    var length: Int
}

//0, 1, 2의미
var rangeOfFixeedIntegers = FixedLengthRange(startValue: 0, length: 3)

//4, 5, 6
rangeOfFixeedIntegers.startValue = 4
//rangeOfFixeedIntegers.length = 3 //오류: 상수에 할당하면 값을 변경할 수 없음

//0, 1, 2
var rangeOfFlexibleIntegers = FlexibleLengthRange(startValue: 0, length: 3)

//0, 1, 2, 3 , 4
rangeOfFlexibleIntegers.length = 5


//지연 저장 프로퍼티 -> 호출되기 전에는 선언만 된 상태로 대기하다가 실제로 호출되는 시점에서 초기화가 이루어지는 저장 프로퍼티
class onCreate{
    init () {
        print("OnCreate!!")
    }
}

class LazyTest {
    var base = 0
    lazy var late = onCreate()
    
    init(){
        print("Lazy Test")
    }
}

let lz = LazyTest()
lz.late


//클로저를 이용한 저장 프로퍼티 초기화

class PropertyInit{
    
    //저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행
    var value01: String! = {
        print("value01 execute")
        return "value01"
    }()
    
    let value02: String! = {
        print("value02 execute")
        return "value02"
    }()
    
    lazy var value03: String! = {
        print("value03 execute")
        return "value03"
    }() //lazy키워드 때문에 클로저가 실행되지 않음
}

let s = PropertyInit()
s.value01
s.value02

let s1 = PropertyInit()

//lazy키워드로 인해 정의한 저장 프로퍼티를 클로저 구문으로 초기화 하면 최초 한 번만 로직이
//실행되는 데다 실제로 참조되는 시점에 맞추어 초기화 되기 때문에 메모리 낭비를 줄일 수 있다.
s1.value03



/*연산 프로퍼티 - 필요한 값을 제공한다는 점에서 저장 프로퍼티와 같지만,
실제 값을 저장했다가 반환하지는 않고 대신 다른 프로퍼티의 값을 연산 처리하여 간접적으로 값 제공*/

struct UserInfo{
    //저장 프로퍼티
    var birth: Int!
    
    //연산 프로퍼티 - 코드에서 나이는 특정 연산을 통해 얻을 수 있는 값을 정의 할 때 사용
    var thisYear: Int!{
        get {
            let df = DateFormatter()
            df.dateFormat = "yyyy"
            return Int(df.string(from: Date()))
        }
    }
    
    var age: Int {
        get {
            return (self.thisYear - self.birth) + 1
        }
    }
}

let info = UserInfo(birth: 1998)
print(info.age)



struct Rect {
    
    //사각형이 위치한 기준 좌표
    var originX: Double = 0.0, originY: Double = 0.0
    
    //가로 세로 길이
    var sizeWidth: Double = 0.0, sizeHeight: Double = 0.0
    
    //사각형의 X 좌표 중심
    var centerX: Double {
        get{
            return self.originX + (sizeWidth / 2)
        }
        
        set(newCenterX) {
            originX = newCenterX - (sizeWidth / 2)
        }
    }
    
    //사각형의 Y 좌표 중심
    var centerY : Double {
        get {
            return self.originY + (self.sizeHeight/2)
        }
        set(newCenterY) {
            self.originY = newCenterY - (self.sizeHeight / 2)
        }
    }
}

var square = Rect(originX: 0.0, originY: 0.0, sizeWidth: 10.0, sizeHeight: 10.0)
print("square.centerX =  \(square.centerX), square.centerY = \(square.centerY)")

// ========================================

struct Position {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}


struct newRect {
    
    var origin = Position()
    var size = Size()
    
    // 밑에 set을 지울경우 -> 읽기 전용 (Read-Only) 속성으로 정의된 center 프로퍼티
    var center: Position {
        get {
            let centerX = self.origin.x + (self.size.width / 2)
            let centerY = self.origin.y + (self.size.height / 2)
            return Position(x: centerX, y: centerY)
        }
        set(newCenter) {
            self.origin.x = newCenter.x - (size.width / 2)
            self.origin.y = newCenter.y - (size.height / 2)
        }
    }
}


let newP = Position(x: 0.0, y: 0.0)
let newS = Size(width: 10.0, height: 10.0)

var square1 = newRect(origin: newP, size: newS)
print("square1.centerX = \(square1.center.x), square1.centerY = \(square1.center.y)")

square1.center = Position(x: 20.0, y: 20.0)
print("sqiare1.x = \(square1.origin.x), square1.y = \(square1.origin.y)")


//프로퍼티 옵저버 - 특정 프로퍼티를 계속 관찰하고 있다가 프로퍼티의 값이 변경되면 이를 알아차리고 반응함

//willSet : 프로퍼티의 값이 변경되기 직전에 호출되는 옵저버 - 상수 newValue라는 이름으로
//didSet : 프로퍼티의 값이 변경된 직후에 호출되는 옵저버 - 상수  onValue라는 이름으로 자동 전달

struct Job {
    var income: Int = 0{
        willSet(newIncome){
            print("이번 달 월급은 \(newIncome)원입니다.")
        }
        didSet {
            if income > oldValue {
                print("월급이 \(income - oldValue)원 증가하셨네요. 소득세가 상향조정될 예정입니다.")
            }else{
                print("저런, 월급이 삭감되었군요.")
            }
            
        }
        
    }
    
}

var job = Job(income: 1000000)
job.income = 2000000
job.income = 1500000


/*타입 프로퍼티 - 저장 프로퍼티나 연산 프러퍼티는 클래스 또는 구조체 인스턴스를 생성한 후 이 인스턴스를 통해서만 참조할 수 있는 프로퍼티이다.
              이는 이들 프로퍼티가 인스턴스에 관련된 값을 저장하고 다루므로 인스턴스 프로퍼티라고 부른다. 하지만 경우에 따라서는 인스턴스에 관련된 값이 아닌
              클래스나 구조체, 또는 열거형과 같은 객체 자체에 관련된 값을 다루어야 할 때도 있는데. 이때는 인스턴스를 생성하지 않고 클래스나 구조체 자체에 값을
              저장하게 되며 이를 타입 프로퍼티라고 한다. (자바에서 클래스 변수와 같음)
 */


struct Foo {
    
    //타입 저장 프로퍼티
    static var sFoo = "구조체 타입 프로퍼티 값"
    
    //타입 연산 프로퍼티
    static var cFoo: Int{
        return 1
    }
}

class Boo {
    
    //타입 저장 프로퍼티
    static var sFoo = "클래스 타입 프로퍼티 값"
    
    static var cFoo: Int{
        return 10
    }
    
    //재정의가 가능한 타입 연산 프로퍼티
    class var oFoo: Int{
        return 100
    }
}

print(Foo.sFoo)
Foo.sFoo = "새로운 값"
print(Foo.sFoo)

print(Boo.sFoo)
print(Boo.cFoo)



//매소드


struct Resolution1 {
    var width = 0 //프로퍼티 or 멤버변수라 함
    var height = 0
    
    // 인스턴스 메소드 - 클래스, 구조체, 열거형과 같은 객체 타입이 만들어 내는 인스턴스에 소속된 함수
    func desc() -> String{
        let desc = "이 해상도는 가로 \(self.width) X \(self.height) 로 구성됨" // self는 클래스나 구조체 자기 자신을 가리킴
        return desc
    }
}

var call = Resolution1()
call.width


struct Resolution2 {
    var width = 0 //프로퍼티 or 멤버변수라 함
    var height = 0
    
    // 인스턴스 메소드 - 클래스, 구조체, 열거형과 같은 객체 타입이 만들어 내는 인스턴스에 소속된 함수
    func judge() -> Bool{
        let width = 30
        return self.width == width
    }// false
}


class Counter {
    
    var count = 0
    
    func increment() {
        self.count += 1
    }
    
    func incrementBy(amount: Int) {
        self.count += amount
    }
    
    func reset() {
        self.count = 0
    }
}

let counter = Counter()
counter.increment()
counter.incrementBy(amount: 5)
counter.reset()



//!! 주의할 점 : 구조체나 열거형의 인스턴스 메소드 내부에서 프로퍼티의 값을 수정할 때는 반드시 메소드 앞에 'mutating' 이라는 키워드를 추가해야 한다. 클래스는 별도의 키우드가 필요하지 않다.
struct Point1 {
    var x = 0.0, y = 0.0
    mutating func moveByX(x deltaX: Double, y deltaY: Double){
        self.x += deltaX
        self.y += deltaY
    }
}

var point = Point1(x: 10.5, y:12.0)
point.moveByX(x: 3.0, y: 4.5)
print("이제 새로운 좌표는 (\(point.x), \(point.y)입니다.")


//타입 메소드 - 인스턴스를 생성하지 않고도 호출할 수 있는 메소드(static)

class Foo1 {
    //타입 메소드 선언
    class func fooTypeMethod(){
        
    }
}

let f = Foo1()
//f.fooTypeMethod() //오류
Foo1.fooTypeMethod()


// 상속
class A {
    var name = "Class A"
    
    var description: String {
        return "This class name is \(self.name)"
    }
    
    func foo(){
        print("\(self.name)'s method foo is called")
    }
}

//자바와 마찬가지로 클래스는 다중 상속 불가!!
class B : A{
    
    var prop = "Class B"
    
    func boo() -> String {
        return "class B prop = \(self.prop)"
    }
}

let b = B()
b.prop
b.boo()

b.name
b.foo()


//오버라이딩 - 메소드 재정의

class Vehicle {
    var currentSpeed = 0.0
    
    var description: String { // 만약 final이 붙을 경우 다른 클래스에서 오버라이딩을 할 수 없음
        return "시간당 \(self.currentSpeed)의 속도로 이동하고 있음"
    }
    
    func makeNoise(){
        
    }
}

class Car: Vehicle {
    var gear = 0
    var engineLevel = 0
    
    override var currentSpeed: Double {
        get {
            return Double(self.engineLevel * 50)
        }
        set {
            
        }
    }
    
    override var description: String {
        get {
            return "Car: engineLevel=\(self.engineLevel), so currentSpeed = \(self.currentSpeed)"
        }
        set {
            print("New Value is \(newValue)")
        }
    }
}

let c = Car()

c.engineLevel = 5
c.currentSpeed
c.description = "New Class Car"

print(c.description)


class HybridCar: Car {
    
}

class kickBoard: Vehicle {
    
}

let h = HybridCar()
h.description

let k = kickBoard()
k.description


class SUV: Car{
    var fourWheel = false
}

let jeep: Vehicle = SUV()

//타입 캐스팅
let trans: Vehicle = Car()// 가능

//let car: Car = Vehicle() //불가능

//타입 비교 연산자

Car() is Vehicle
Car() is HybridCar
kickBoard() is Vehicle


let myCar: Vehicle = Car()

if myCar is Car {
    print("myCar는 Car 타입")
}else {
    print("Car 타입 아님")
}


//타입 캐스팅 연산(업캐스팅, 다운캐스팅)

let anyCar: Car = SUV()
let anyVehicle = anyCar as Vehicle // 업캐스팅 (Car 타입을 Vehicle타입으로)

let anySUV = anyCar as? SUV // Car 타입을 SUV 타입으로 다운 캐스팅 (?로 인해 결과는 옵셔널 타입)
if anySUV != nil {
    print("\(anySUV!) 캐스팅 성공")
}

//다운 캐스팅이 반드시 성공할 것이라는 확신이 있다면 강제캐스팅(!)을 사용해도 된다.
let anySUV1 = anyCar as! SUV
print("\(anySUV1) 캐스팅 성공")



//Any, AnyObject
//AnyObject - 클래스의 일종으로 모든 종류의 클래스 타입을 저장할 수 있는 범용 타입의 클래스(클래스일 때만 AnyObject타입으로 정의할 수 있음 -> 구조체, 열거형일 때 는 불가!!)

//Any - AnyObject처럼 클래스에 국한되지 않고 스위프트에서 제공하는 모든 타입을 허용함(실제 사용해보면 불편한 점이 많음 - 사용주의!!)

var allCar: AnyObject = Car()
allCar = SUV()

func move(_ param: AnyObject) -> AnyObject {
    return param
}

move(Car())
move(Vehicle())


var list = [AnyObject]()
list.append(Car())
list.append(Vehicle())


var value: Any = "sample"

value = 3
value = false
value = 2.3
value = [1,2,3,4]
value = {
    print("만능")
}



//초기화 구문

//init 초기화 메소드 (자바에서의 생성자)
struct Resolution3 {
    var width = 0
    var height = 0
    
    //초기화 메소드 : Width 인자값으로 받음
    init(width: Int){
        self.width = width
    }
}


class VideoMode3 {
    
    var resolution = Resolution3(width: 2048)
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    //초기화 메소드: interlaced, frameRate 두 개의 인자값을 받음
//    init() {
//
//    }
    
    //초기화될 때 name 인자값을 받는 init 구문
    init(name: String = "") {
        self.name = name
    }
    
    init(interlaced: Bool, frameRate: Double) {
        self.interlaced = interlaced
        self.frameRate = frameRate
    }
    
    init(interlaced: Bool, frameRate: Double, name: String){
        self.interlaced = interlaced
        self.frameRate = frameRate
        self.name = name
    }
}

let defaultVideoMode = VideoMode3()

let resolution3 = Resolution3.init(width: 4096)
let videoMode3 = VideoMode3.init(interlaced: true, frameRate: 40.0)

//init 메서드를 생략해도 내부적으론 초기화 됨
let resolution4 = Resolution3(width: 4096)
let videoMode4 = VideoMode3(interlaced: true, frameRate: 40.0)


let nameVideoMode = VideoMode3(name: "홍길동")
let simpleVideoMode = VideoMode3(interlaced: true, frameRate: 40.0)


//초기화 구문의 오버라이딩
class Base{
    var baseValue: Double
    init(inputValue: Double){
        self.baseValue = inputValue
    }
}

/*메소드와 달리 초기화 구문에서의 오버라이딩은 더 이상 부모클래스에서 정의한 초기화 구문이 실행되지 않을 수 있고 부모 클래스의
  프로퍼티의 초기화가 누락될 수 있는 오류가 발생할 수 있기 때문에 초기화 구문을 오버라이딩 할 경우 부모 클래스의 정의된 초기화 구문을
  내부적으로 호출해야 하는데 오버라이딩 된 초기화 구문 내부에 super.init 구문을 작성하면 된다.
 */
class ExBase: Base{
    override init(inputValue: Double){
        super.init(inputValue: 10.5)
    }
}

//초기화 구문 델리게이션 - 연쇄적으로 오버라이딩된 자식 클래스의 초기화 구문에서 부모 클래스의 초기화 구문에 대한 호출이 발생하는 것

class Base1{
    var baseValue: Double
    init() {
        self.baseValue = 0.0
        print("Base Init")
    }
    
    init(baseValue: Double){
        self.baseValue = baseValue
    }
}

class ExBase1: Base1{
    /* 부모 클래스인 Base1에 기본 초기화 구문외에 다른 형식의 초기화 구문이 추가되어 있다면 자식클래스에서 기본 초기화 구문을 오버라이딩 할 때
        명시적으로 부모 클래스의 기본 초기화 구문을 호출해야 함!
     */
    override init(){
        super.init()
        print("ExBase Init")
    }
}

let ex = ExBase1()



//옵셔널 체인!!

struct Human {
    var name: String?
    var man: Bool = true
}

var boy: Human? = Human(name: "홍길동", man: true) //boy는 옵셔널 타입임


//boy를 사용하려면 옵셔널 타입에 대한 안정성 검사가 필요함!!
if boy != nil {
    if boy!.name != nil {
        print("이름은 \(boy!.name!)")
    }
}

//옵셔널 비강제 해제 구문
if let b = boy {
    if let name = b.name {
        print("이름은 \(name)입니다.")
    }
}


struct Company {
    var ceo: Human?
    var companyName: String?
}

var staruup: Company? = Company(ceo: Human(name: "대표", man: false), companyName: "루비페이퍼")

if let company = staruup {
    if let ceo = company.ceo{
        if let name = ceo.name{
            print("대표이사의 이름은 \(name)입니다")
        }
    }
}

//강제 해제 연산자로도 참조할 수 있지만 이는 런타임 오류를 일으킬수 있기 때문에 좋은 방법은 아님
if let name = staruup!.ceo!.name {
    print("대표이사의 이름은 \(name)입니다")
}


//옵셔널 체인 - ?연산자를 사용하여 옵셔널 타입을 참조
staruup?.ceo?.name

if let name = staruup?.ceo?.name {
    print("대표이사의 이름은 \(name)입니다.")
}


struct Company1 {
    var ceo: Human?
    var companyName: String?
    func getCEO() -> Human? {
        return self.ceo
    }
}

var someCompany: Company1? = Company1(ceo: Human(name: "팀 쿡", man: true), companyName: "Apple")
let name = someCompany?.getCEO()?.name

if name != nil {
    print("대표이사의 이름은 \(name!)입니다.")
}


