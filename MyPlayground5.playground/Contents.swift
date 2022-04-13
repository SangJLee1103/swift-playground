import UIKit

//옵셔널: 스위프트에서 도입된 새로운 개념으로 프로그램의 안전성을 높이기 위해 사용하는 개념, nil을 사용할 수 있는 타입(옵셔널)과 사용할 수 없는 타입 구분
//      언젠가 오류가 발생할 수 있는 가능성이 아주 조금이라도 있다면 모두 옵셔널 타입으로 정의해야 함, 언어의 안정성을 위해 가급적 오류를 발생시키지 않으려고 노력함!
//      오류가 발생하면 프로그램의 실행 흐름이 중단되고 앱의 동작이 멈추거나 아예 꺼질수 있으므로 오류를 발생시키지 않고 억지로 값을 반환하려고 노력함 따라서 nil이        존재!!

//      일반 자료형은 nil을 갖을 수 없음 이 때 사용하는 타입이 옵셔널 타입임 옵셔널 타입으로 선언된 자료형은 nil 값을 저장 할 수 있음
//      옵셔널 타입은 별도로 존재하는 자료형이 아닌 모든 기본 자료형들에 대응하는 옵셔널 타입이 존재함


Int("123") // Optional객체로 감싸져 있음
Int("안녕하세요") // nil


//옵셔널 타입: 옵셔널 타입으로 자료형을 선언하면 자동으로 nil로 초기화
var optInt: Int?

var optStr: String?
optStr = "Swift"

var optDouble: Double?
optDouble = 2.3

var optArr: [String]?

//옵셔널 Dictionary타입
var optDic: Dictionary<String, String>?
var optDic2: [String: String]?

//옵셔널 Class 타입
var optClass: AnyObject?



//옵셔널 값의 안전한 해제

var str = "123"
var intFromStr = Int(str)

if intFromStr != nil {
    print("값이 변환됨. 변환된 값은 \(intFromStr)")
}else {
    print("값 변환에 실패하였습니다.")
}


//옵셔널 바인딩 -> 조건문 내에서 일반 상수에 옵셔널 값을 대입하는 방식
var String = "Swift"
if let intFromStr = Int(str) {
    print("값 변환. 변환된 값은 \(intFromStr)")
}else{
    print("변환 실패")
}
    

//컴파일러에 의한 옵셔널 자동 해제 -> 옵셔널 객체의 값을 비교 연산자를 사용하여 비교하는 경우,
//명시적으로 옵셔널 객체를 강제해제하지 않아도 한쪽이 옵셔널, 다른 한쪽이 일반 타입이라면 자동으로 옵셔널 타입을 해제하여 비교 연산을 수행합니다.

let optionalInt = Int("123")

if((optionalInt!) == 123){
    print("optInt == 123")
}else{
    print("optInt != 123")
}


//옵셔널 값의 할당
var optValue01 = Optional(123)
var optValue02: Int? = 123


//명시적 옵셔널 선언
var string: String! = "Swift Optional"
print(string)

var value01: Int? = 10
//value01 +=5 //오류

var value02: Int! = 10
value02+=5
print(value02)


