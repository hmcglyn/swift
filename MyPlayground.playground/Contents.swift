import UIKit

//var myAge=32
//if myAge<30 {
//    print("30 -")
//} else if myAge>30 && myAge < 40{
//    print("30 +")
//}
    
func testFunc(x : Int32,y : Int32) -> Int32{
    return x+y
}

print(testFunc(x:12, y: 5))

func logicFunc(a: Int,b : Int) -> Bool{
    return a>b
}

var myAge="f"

var val = (Int(myAge) ?? 0) * 5

if let myNumb = Int(myAge) {
    print(myNumb*5)
} else {
    print("wrong input")
}
//var userName="Sylvanas"
//var userSurname="Windrunner"
//
//var n1=50
//var n2=4
//
//
//let pi=3.17
//
//var myString : String = "50"
//
//let numb = Int32(myString)
//
//var numbArrays = [2,1,4,3,5]
//
//numbArrays[numbArrays.count-1]
//
//numbArrays.sort()
//
////Set Unordered List
//var setVariable : Set = [1,2,3,4,5]
//
//var set1 : Set = [1,2,3]
//var set2 : Set = [3,4,5]
//
//var set3 : Set = set1.union(set2)
//
////Dictionary
//var directors : [String : String] = ["Tarantino" : "Pulp Fiction","Christopher Nolan" : "The Dark Knight"]
//
//
//directors["Akira Kurisowa"] = "Seven Samurai"
//var number=1;
//while number<10
//{
//    print(number)
//    number+=1
//}
//
//for item in directors
//{
//    print(item.value)
//}
//
//
//for item in 1...5
//{
//    print(item)
//}


