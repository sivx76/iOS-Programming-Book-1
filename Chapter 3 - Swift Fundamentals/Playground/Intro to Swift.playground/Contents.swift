import UIKit


// MARK: - Variables
var str = "Hello, playground"

var myfirstName = "Ben"
print(myfirstName)

myfirstName = "Danny"
print(myfirstName)


let numberConstant = 5
print(numberConstant + 2)

//numberConstant = 10



// MARK: - Comments

//Use comments to explain your ccode


/*
 We can also use multiline comments to explain more information
 Here we present info across many lines, that we do not want the Swift compiler to run
 Use this for occasional documentation
 */


// MARK: - Data Types

//Strings are textual data
print(type(of: myfirstName))

let fullName = myfirstName + " Alemu"
print(fullName)

let password = "123abcX!"
let userInput = "swift123"
let grantUserAccess: Bool = password == userInput
print(grantUserAccess)


//Numbers

8 + 2
35 - 6
9 * 10
10 / 3

8 % 3
pow(5, 2)



let revenue: Int = 70000
let cost: Int = 2000
let profit = revenue - cost
print(profit)

let taxation: Float = 32.5 / 100
let lostToTaxation = Float(revenue) * taxation
let netIncome = Float(revenue) - lostToTaxation
print("We earn this much after taxes: \(netIncome)")


//Booleans represent true or false values
let isParent = true
let numberChildren = 0

if isParent && numberChildren == 0 {
    print("Congrats on your first child!")
}

let haveSiblings = numberChildren > 0
print(haveSiblings)

//Show comparison operators and logical operators


let phoneOS = "Android"
let tablet = "iPad"

let haveiOSDevice = (phoneOS == "iOS") || (tablet == "iPad")
print(haveiOSDevice)


//MARK: - Collection Types

//Arrays are ordered lists of data
let bestFriends = ["JJ", "Steve", "Mike", "Harsh"]

for name in bestFriends {
    print(name)
}


var languages: [String] = ["English"]
languages.append("Spanish")
languages.append("Amharic")
languages.append("Hindi")



var numbers = 1...10

for n in numbers {
    print(n)
}


let grades = [92, 85, 88, 91, 98, 76]

let firstTestResult = grades[0]
let thirdTestResult = grades[2]
let lastTestResult = grades.last

let numberOfTests = grades.count


var sum = 0            //not let | can make double
var average = 0

for grade in grades {
    sum = grade + sum
    print(sum)
}

average = sum / numberOfTests
print(average)


let gradesOver90 = grades.filter( {$0 > 90} )
print(gradesOver90)

let correctedGrades = gradesOver90.compactMap({ $0 + 2} )
print(correctedGrades)



//Dictionaries associate keys with values
var phoneBook : [String: Int] = [
    
    "Anika": 1234567890,
    "Ryan": 820382001,
    "David": 456017902,
    "Amanda": 329383991
]

let anikaNumber = phoneBook["Anika"]
let davidNumber = phoneBook["David"]


phoneBook["Anika"] = 14628910
print(phoneBook["Anika"])

phoneBook["Mystic of East"] = 1028930309
print(phoneBook["Mystic of East"])

phoneBook.removeValue(forKey: "David")


let allContacts = phoneBook.keys
let allPhoneNumbers = phoneBook.values
print(allContacts)
print(allPhoneNumbers)


//MARK: - Control flow
let value = 20

if value < 5 {
    print("Our value is small")
}


if value < 5 {
    print("Our value is very small")
} else {
    print("Our value is larger than 5")
}



let age = 66
var ageGroup = ""

if age >= 18 && age < 65 {
    ageGroup = "Adult"
} else if age >= 13 && age < 18 {
    ageGroup = "teenager"
} else if age < 2 {
    ageGroup = "Infant"
} else {
    ageGroup = "Elderly"
}

print(ageGroup)


//MARK: - Functions

var apples = 2

func addApple() {
    apples = apples + 1
}

addApple()
addApple()

print(apples)


func selectFruit() -> String {
    
    let possibleFruits = ["Apple", "Banana", "Strawberry", "Grapes", "Peach", "Mango", "Watermelon"]
    let numberOfFruits = possibleFruits.count
    
    let randomNumber = Int.random(in: 0..<numberOfFruits)
    
    let selectedFruit = possibleFruits[randomNumber]
    
    return selectedFruit
    
}

let fruitOfTheDay = selectFruit()



func computeSavings(revenue: Float, expenses: Float) -> Float {

    let taxRate: Float =  32.5 / 100
    let taxedIncome = revenue * taxRate
    
    let netIncome = revenue - taxedIncome
    
    let savings: Float = netIncome - expenses
    
    return savings
}

var savings = computeSavings(revenue: 10000, expenses: 30)
print(savings)

var anotherSavings = computeSavings(revenue: 3000, expenses: 2000)
print(anotherSavings)
