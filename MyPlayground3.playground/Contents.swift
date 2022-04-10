import UIKit


// 반복문
//for 문
for row in 1 ... 5 {
    print(row)
}

for row in 1 ... 9 {
    print("2 X \(row) = \(row * 2)")
}

var lang = "swift"
for char in lang {
    print("개별 문자는 \(char)입니다.")
}

//루프상수 생략!!(_ 언더바)
let size = 5
let padChar = "0"
var keyword = "3"

for _ in 1 ... size {
    keyword = padChar + keyword
}

print("\(keyword)")

//이중 루프

for i in 1 ..< 10 {
    for j in 1 ..< 10 {
        print("\(i) X \(j) = \(i*j)")
    }
}

//while문

var n = 2
while n < 1000{
    n *= 2
}

print("n = \(n)")


//repeat - while문  == do - while문 실행블록의 수행 최소 한 번은 보장

var n1 = 1024

repeat{
    n1 = n1 * 2
}
while n < 1000
        
print("n1 = \(n1)")

        
//조건문 if, guard, switch
        
var adult = 19
var age = 15
var gender = "M"

if adult > age {
    if gender == "M" {
        print("남성 미성년자!")
    }else {
        print("여성 미성년자!")
    }
}else {
    if gender == "M" {
        print("남성 성년자!")
    }else {
        print("여성 성년자!")
    }
}


//guard - 실행 흐름을 종료하기 위한 목적으로 사용

func divide(base: Int){
    guard base != 0 else {
        print("연산할 수 없습니다.")
        return
    }
    
    guard base > 0 else{
        print("base는 0보다 커야 합니다")
        return
    }
    
    guard base < 100 else{
        print("base는 0보다 작아야 합니다.")
        return
    }
    
    let result = 100 / base
    print(result)
}

divide(base: 0)

//switch

let val = 2

switch val {
    case 1:
        print("일치한 값은 1입니다.")
    case 2:
        print("일치한 값은 2입니다.")
    case 2: //다른 언어라면 실행되지만 스위프트의 특성상 패턴 하나만 일치하면 실행되지 않음
        print("일치한 값 2가 더 있습니다.")
    default :
        print("어느 패턴과도 일치하지 않습니다.")
}

let value = 2

switch value {
    case 0, 1:
        print("0 또는 1입니다.")
    case 2, 3:
        print("2 또는 3입니다.")
    default :
        print("어느 패턴과도 일치하지 않습니다.")
}

var value1 = (2, 3)

switch value1 {
    case let (x, 3) :
        print("튜플의 두 번째 값이 3일 때 첫 번째 값은 \(x)입니다.")
    case let (3, y) :
        print("튜플의 첫 번째 값이 3일 때 두 번째 값은 \(y)입니다.")
    
    case let (x, y):
        print("튜플의 값은 각각 \(x), \(y)입니다.")
}

var value2 = (2, 3)

switch value2 {
    case(0..<2, 3):
        print("범위 A에 포함되었습니다.")
    case(2..<5, 0..<3):
        print("범위 B에 포함되었습니다.")
    case(2..<5, 3..<5):
        print("범위 C에 포함되었습니다.")
    default:
        print("범위 D에 포함되었습니다.")
}


//falthrough

let sampleChar: Character = "a"

switch sampleChar {
    case "a":
        fallthrough
    case "A":
        print("글자는 A 입니다")
    default :
        print("일치하는 글자가 없습니다.")
}


for row in 0 ... 5{
    if row < 2{
     continue
    }
    print("executed data is \(row)")
}


//구문 레이블

outer: for i in 1 ... 5 {
            inner: for j in 1 ... 9 {
                if(j==3){
                    break outer
                }
                print("\(i) X \(j) = \(i*j)")
            }
}
