//변수

var vValue = 3 //변수 선언 및 초기화
vValue = 7
//vValue = "안녕하세요" //변수의 값을 바꿀 때는 타입을 맞추어야 함
var 🧑🏻‍💻 = "lsj" //특수문자도 변수명으로 사용가능

//상수
let cValue = 3
//cValue = 7 //상수는 초기 값을 변경할 수 없음


Int.max
Int64.max

//문자형, 문자열형 둘다 "" 사용 '' -> X
var projectname = "ios study"
let language = "swift"


/*타입 추론과 타입 어노테이션
타입 어노테이션이란 변수나 상수를 선언할 때 그 타입을 명시적으로 선언해 줌으로써 어떤 타입의 값이 저장될 것인지를 컴파일러에 직접 알려주는 문법*/

var firstLetter : Character = "S" //타입 어노테이션이 빠질경우 String!
print(type(of: firstLetter))

//var year //오류 -> 타입어노테이션이 빠짐
//year = 2022

var datetime : Int
datetime = 2022

var temper1 = 3
var temper2: Float = 3 //3.0으로 변환


//서로 다른 타입간의 결합

var stmt = "꼼꼼한 재은씨의 키는"
var height = 185
var heightstmt = stmt + String(height)


//문자열 템플릿

let name = "꼼꼼한 재은씨"
let year = 2014
let month = 10
let day = 1

let profile = "\(name)는 \(year)년 \(month)월 \(day)일에 출간되었습니다."
print(profile)


let apple = 3
let banana = 2
let orange = 4
let desc = "과일은 총 \(apple + banana + orange)개입니다"
print(desc)


//쿼우팅 -> 스위프트에선 더블 쿼우팅으로 처리하기 때문에 문자열과 문자 타입을 확실히 구분해 주어야 한다.
let Hello = "Hi, I'm winny"
var message = Hello
print(message)


//트리플 쿼우팅
let data = """
안녕하세요?
오랜만이에요.
피곤하네요!
"""
print(data)


//닫힌 범위 연산자
let a = 1
let b = 2

for row in a...b {
    row
}

//반 닫힌 범위 연산자
//
//for row in a..<b {
//    row
//}
