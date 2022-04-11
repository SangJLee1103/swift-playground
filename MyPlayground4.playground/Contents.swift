import UIKit


//배열 - 순서 있는 데이터를 저장할 때 사용하면 중복된 값 저장 가능
//정적배열
var cities = ["Seoul", "New York", "LA", "Santiago"]
cities[0]
cities[1]
cities[2]
cities[3]
cities

let length = cities.count // 배열 cities의 길이

//반복문을 통한 배열 순회
for i in 0..<length{
    print("\(i)번째 배열 원소는 \(cities[i])")
}

//Iterator를 통한 순회
for row in cities{
    print("배열 원소는 \(row)")
}

//Iterator와 index
for row in cities{
    let index = cities.index(of: row)
    print("\(index!)번째 배열 원소는 \(row)")
}

//동적 배열
var towns = Array<String>() // 문자열 배열의 선언 및 초기화

var countries: Array<String> //문자열 배열 선언
countries = Array()//배열의 초기화

//다양한 배열 선언 및 초기화

var fruits : [String]
cities = [String]()


var fruits1: [String]
fruits1 = []

var fruits2: [String] = []

var fruits3 : Array<String> = [String]()

var fruits5: [String] = Array()

//배열의 비어 있는 여부
if fruits5.isEmpty {
    print("비어 있는 상태")
}else{
    print("비어 있지 않음")
}


//배열 아이템 동적 추가

//append
var city = [String]()

city.append("Seoul")
city.append("New York")
city.insert("Tokyo", at: 1)
city.append(contentsOf: ["Dubai", "Sydney"])

city[2] = "Madrid" //값을 추가하는 용도로는 사용할 수 없고 수정 용도로만 사용 가능
city


var items = Array(repeating: "NONE", count: 3) //기본값 NONE, 배열의 길이 3
var items1 = [String](repeating: "NONE", count: 3) //다른 방법


//범위 연산자를 통한 인덱스 참조
var alphabet = ["a", "b", "c", "d", "e"]

alphabet[0...2]
alphabet[2...3]

alphabet[1...2] = ["1", "2", "3"]
alphabet



//Set (집합) -> 중복X, 순서 없는 데이터를 저장할 때 사용

var genres : Set = ["Classic", "Rock", "Ballad"] //타입 추론이 가능한경우
var genre : Set<String> = [] //타입 추론이 불가능한 경우 어노테이션을 사용해야함

if genres.isEmpty {
    print("집합이 비었습니다")
} else {
    print("집합에는 현재 \(genres.count) 개의 아이템이 저장됨")
}

for g in genres.sorted() { //genres 집합 정렬
    print(g)
}

genres.insert("CCM")
genres.insert("Ballad") // 중복 불가
genres
genres.remove("Rock")
genres

if genres.contains("Rock"){
    print("Rock 아이템이 저장되어 있음.")
}else {
    print("Rock 아이템이 저장되어 있지 않음")
}

//집합 연산

var oddDigits: Set = [1, 3, 5, 7, 9] //홀수 집합
var evenDigits: Set = [0,2, 4, 6, 8] //짝수 집합
var primeDigits: Set = [2, 3, 5, 7] // 소수 집합

oddDigits.intersection(evenDigits).sorted() // 교집합
oddDigits.symmetricDifference(primeDigits).sorted() // 어느 한쪽에만 있는 아이템을 선택하여 새로운 집합을 만듬
oddDigits.union(evenDigits).sorted() // 합집합

oddDigits.subtract(primeDigits) // 차집합
oddDigits.sorted()


//중복이 있는 배열을 중복이 없는 배열로
var A = [1, 1, 2, 3, 4, 5, 5, 6]

let B = Set(A)
A = Array(B)


//튜플 -> 여러 타입을 저장할 수 있음, 수정,삭제,추가 불가, 내부적으로 순서가 있지만 순회처리를 지원하지 않음

let tupleValue = ("a", 1, 2.3, true)

tupleValue.0
tupleValue.2

var tpl01: (Int, String) = (100, "hello")

func getTupleValue() -> (String, String, Int){
    return ("t", "v", 100)
}

let(a, b, c) = getTupleValue()


//딕셔너리 -> 순서없는 데이터를 키-값 형태로 저장할 때 사용하며 중복된 값을 저장할 수 있지만 중복된 키 사용불가!

var capital = ["KR": "Seoul", "EN": "London", "FR": "Paris"] //타입추론이 가능

capital["KR"]
capital["FR"]

Dictionary<String, Int>() //딕셔너리 선언시 Dictionary구조체 사용, 타입추론이 불가능하므로 타입추론 어노테이션 사용

[String : Int]()

var capital1 = Dictionary<String, String>()//방법 1
var capital2 = [String : String]()//방법 2


//딕셔너리에 동적으로 아이템 추가

var newCapital = [String:String]()
newCapital["JP"] = "Tokyo"

newCapital.updateValue("Seoul", forKey: "KR")
newCapital.updateValue("London", forKey: "EN")
newCapital.updateValue("Sapporo", forKey: "JP")
newCapital

newCapital["KR"] = nil
newCapital.removeValue(forKey: "EN")
newCapital


newCapital.updateValue("Seoul", forKey: "KR")
newCapital.updateValue("London", forKey: "EN")

//딕셔너리 순회
for row in newCapital {
    let(key, value) = row
    print("현재 데이터는 \(key) : \(value)입니다.")
}

for (key, value) in newCapital{
    print("현재 데이터는 \(key) : \(value)입니다.")
}
