//함수

//매개변수와 반환값이 모두 없는 함수
func printHello(){
    print("안녕하세요!")
}

//매개변수가 없지만 반환값은 있는 함수
func sayHello() -> String {
    let returnValue = "안녕"
    return returnValue
}

//매개변수는 있으나 반환값이 없는 함수
func printHelloWithName(name: String){
    print("\(name)님, 안녕하세요")
}

//매개변수와 반환값이 모두 있는 함수
func sayHelloWithName(name: String) -> String {
    let returnValue = "\(name)님, Hi"
    return returnValue
}

printHello()

let name = "ssss"
print(sayHelloWithName(name: "sj")) // name: 인자 레이블!! 없으면 컴파일 에러

//인자레이블이 붙는 이유 오브젝티브-C와의 호환성을 위해 사용함

func times(x: Int, y: Int) -> Int{
    return (x * y)
}

times(x: 5, y: 10) //함수의 이름만으로 호출
times(x:y:)(5, 10) // 함수의 식별자를 사용하여 호출


//튜플을 반환하는 함수

func getUserInfo() -> (Int, Character, String) {
    
    //데이터 타입이 String으로 추론되는 것을 방지하기 위해 타입 어노테이션 선언
    let gender: Character = "M"
    let height = 180
    let name = "꼼꼼한 재은씨"
    return (height, gender, name)
}

var uInfo = getUserInfo()
uInfo.0 = 180
uInfo.1 = "M"
uInfo.2 = "sj"

var (a, b, c) = getUserInfo()
a = 190
b = "W"
c = "sssss"

print(a, b, c)

func userInfo() -> (h: Int, g: Character, n: String) {
    //데이터 타입이 String으로 추론되는 것을 방지하기 위해 타입 어노테이션 선언
    let gender: Character = "M"
    let height = 180
    let name = "꼼꼼한 재은씨"
    return (height, gender, name)
}

var result = userInfo()
result.h
result.g
result.n


//타입 알리어스
typealias infoResult = (Int, Character, String) // infoResult라는 단어는 (Int, Character, String) 튜플과 동일한 것으로 취급됨

func info() -> infoResult {
    let gender: Character = "M"
    let height = 180
    let name = "꼼꼼한 재은씨"
    
    return (height, gender, name)
}

let information = info()
information.0
information.1
information.2


//내부 매개변수와 외부 매개변수

func hello(to name: String, welcomeMessage msg: String){ //외부 매개변수: to, welcomeMemssage
    print("\(name)님, \(msg)")
}

hello(to: "ssss", welcomeMessage: "hello")

//매개변수 생략 _ -> 문법은 적용하되 사용하지 않고 생략하겠다!
func noHello(_ name: String, _ msg: String){ //외부 매개변수: to, welcomeMemssage
    print("\(name)님, \(msg)")
}

noHello("ssssssss", "hi")


//가변 인자
func avg(score: Int...) -> Double {
    var total = 0
    for i in score {
        total += i
    }
    return (Double(total)/Double(score.count))
}

print(avg(score: 10, 20, 30))


//기본값을 갖는 매개변수
func echo(message: String, newline: Bool = true){
    if newline == true{
        print(message, true)
    }else{
        print(message, false)
    }
}

echo(message: "안녕하세요")
echo(message: "안녕", newline: true)


//매개변수의 수정

//func incrementBy(base: Int) -> Int { //오류!! -> base는 변수가 아닌 상수임
//    base+=1
//    return base
//}

func incrementBy(base: Int) -> Int { //오류!! -> base는 변수가 아닌 상수임
    var base = base
    base+=1
    return base
}

print(incrementBy(base: 1))


//InOut 매개변수 (inout키워드)

var cnt = 30

func autoIncrement(value: Int) -> Int {
    var value = value
    value += 1
    
    return value
}

print(autoIncrement(value: cnt))//31
print(cnt)//30



//inout 키워드 사용 -> inout키워드가 붙은 매개변수는 인자값이 전달될 때 새로운 내부 상수를 만들어 복사하는 대신 인자값 자체를 함수 내부로 전달
//                  사실 inout 키워드의 정확한 의미는 값 자체를 전달하는 것이 아니라 값이 저장된 메모리 주소를 전달함

func foo(paramCount: inout Int) -> Int{
    paramCount += 1
    return paramCount
}

var count = 30
print(foo(paramCount: &count)) //31 &주소 연산자
print(count) // 31


let count1 = 30
//foo(paramCount: &count1) //상수는 inout 매개변수로 인자값 전달 불가
//foo(paramCount: &30)// 리터럴도 불가 , 변수만 가능


//스코프

var k = 30

func fo(k: Int) -> Int {
    var k = k
    k += 1
    return k
}

print(fo(k: k)) // 31
print(k) //30




//일급 객체
/*1. 객체가 런타임에도 생성이 가능해야함
  2. 인자값으로 객체를 전달할 수 있어야 한다.
  3. 반환값으로 객체를 사용할 수 있어야 한다.
  4. 변수나 데이터 구조 안에 저장할 수 있어야 한다.
  5. 할당에 사용된 이름과 관계없이 고유한 구별이 가능해야 한다.
 */


//1. 변수나 상수에 함수 대입 가능

func foo1(base: Int) -> String {
    return "결과값은 \(base + 1)입니다"
}

let fn1 = foo1(base: 5)
let fn2 = foo1 // 상수에 함수 할당
fn2(5)


func boo(age: Int) -> String {
    return "\(age)"
}

func boo(age: Int, name: String) -> String {
    return "\(name)의 나이는 \(age)세 입니다."
}

//let t = boo //오류
let t1: (Int, String) -> String = boo //타입 어노테이션을 통해 입력받을 함수의 타입을 지정
let t2 = boo(age:name:) //함수의 식별값을 통해 입력받을 정확한 함수를 지정


//동일한 함수 타입을 사용하지만 매개변수명만 서로 다른 경우

func boo1(age: Int, name: String) -> String{
    return "\(name)의 나이는 \(age)세 입니다."
}

func boo1(height: Int, nick: String) -> String{
    return "\(nick)의 키는 \(height)입니다."
}

let fn03: (Int, String) -> String = boo1(age:name:)
let fn04: (Int, String) -> String = boo1(height:nick:)

//함수의 식별자를 이용하여도 됨(간단)
let fn05 = boo1(age:name:)
let fn06 = boo1(height:nick:)

//2. 함수의 반환 타입으로 함수를 사용할 수 있음


func desc() -> String{
    return "this is desc()"
}

func pass() -> () -> String { //()-> String == 함수타입
    return desc
}

let p = pass()
p()


func plus(a: Int, b: Int) -> Int {
    return a + b
}

func minus(a: Int, b: Int) -> Int {
    return a - b
}

func time(a: Int, b: Int) -> Int {
    return a * b
}

func divide(a: Int, b: Int) -> Int {
    guard b != 0 else{
        return 0
    }
    return a / b
}

func calc(_ operand: String) -> (Int, Int) -> Int {
    switch operand {
    case "+" :
        return plus
    case "-" :
        return minus
    case "*" :
        return time
    case "/" :
        return divide
    default :
        return plus
    }
}

let res = calc("+")
res(3,4)

calc("-")(10, 10)


//3. 함수의 인자값으로 함수를 사용할 수 있음

func incr(param: Int) -> Int {
    return param + 1
}

//매직코드라고도 함
func broker(base: Int, function fn: (Int) -> Int) -> Int {
    return fn(base)
}

broker(base: 3, function: incr)


//callback 함수 예시

func successThrough() {
    print("연산 처리가 성공했습니다.")
}

func failThrough(){
    print("처리 과정에 오류가 발생함")
}

func divide1(base: Int, success sCallback: () -> Void, fail fCallBack: //클로저(익명함수) 사용
            () -> Void) -> Int {
    guard base != 0 else{
        fCallBack()
        return 0
    }
    
    defer { //함수나 메소드에서 코드의 흐름과 상관없이 가장 마지막에 실행되는 블록
        sCallback()
    }
    return 100 / base
}

divide1(base: 0, success: successThrough, fail: failThrough)



//함수의 중첩

func outer(base: Int) -> String {
    //내부 함수
    func inner(inc: Int) -> String {
        return "\(inc)를 반환"
    }
    let result = inner(inc: base + 1)
    return result
}
outer(base: 3)


func outer1(param: Int) -> (Int) -> String {
    func inner1(inc: Int) -> String {
        return "\(inc)를 리턴합니다."
    }
    return inner1
}

let fnn = outer1(param: 3)
let fnn1 = fnn(30)




//클로저: 내부 함수와 내부 함수에 영향을 미치는 주변환경을 모두 포함한 객체 , !!스위프트에서의 클로저: 익명함수

func basic(param: Int) -> (Int) -> Int {
    let value = param + 20
    
    func append(add: Int) -> Int {
        return value + add
    }
    
    return append
}

//result3에 할당된 클로저 정의
let result3 = basic(param: 10) //클로저가 생성됨  func append(add: Int) -> Int{
//                                                  return 30 + add
//                                            }
result3(10) //40



