//
//  main.swift
//  MoreSwiftFunS2
//
//  Created by Gina Sprint on 10/2/20.
//  Copyright © 2020 Gina Sprint. All rights reserved.
//

import Foundation

print("Hello, World!")

// warm up
//func getPositiveInteger() -> Int {
//    print("Enter a positive integer:")
//    if let inputString = readLine() {
//        if let inputInt = Int(inputString) {
//            if inputInt > 0 {
//                return inputInt
//            }
//        }
//    }
//    return -1
//}
//
//let value = getPositiveInteger()
//print("got:", value)

// MARK: - Guard
// use guard when you want an early exit from a function
// when a condition fails
// useful for reducing heavy if nesting
// with optional binding and guard, the let constants you declare
// have scope outside of the guard
//func getPositiveInteger() -> Int {
//    print("Enter a positive integer:")
//    guard let inputString = readLine(), let inputInt = Int(inputString), inputInt > 0 else {
//        // here, then one of the BCs failed (false)
//        // return as part of an early exit
//         return -1
//    }
//    // here, then the BCs succeeded
//    // can use inputString and inputInt
//    return inputInt
//}
//
//let value = getPositiveInteger()
//print("got:", value)

// MARK: - Error Handling
// when a programmer anticipates that something might go wrong
// they "throw" an error
// the calling code must acknowledge/handle the error

enum UserInputError: Error {
    case invalidInteger
    case invalidPositiveInteger
}

// add the "throws" keyword after the ()
func getPositiveInteger() throws -> Int {
    print("Enter a positive integer:")
    guard let inputString = readLine(), let inputInt = Int(inputString), inputInt > 0 else {
        // here, then one of the BCs failed (false)
        // return as part of an early exit
        throw UserInputError.invalidPositiveInteger
    }
    // here, then the BCs succeeded
    // can use inputString and inputInt
    return inputInt
}

// 2 ways to *handle* the error
// 1. try? optional
//let value = try? getPositiveInteger()
//print("got:", value)

// try? getPositiveInteger()
// 2. try do {} catch {}
//
//do {
//    let value = try getPositiveInteger()
//    print(value)
//}
//catch UserInputError.invalidPositiveInteger {
//    // recover from the error
//    print("Failed to get a positive integer from the user")
//}
//


//// MARK: - Optional Chaining
//// use optional chaining when you want to use a member (property or method) on a value in an optional
//print("Enter in an integer:")
//let inputStringOptional = readLine()
//let numDigits = inputStringOptional?.count
//print(numDigits)
//
//// MARK: - Nil Coalescing Operator ??
//// use ?? when you have a default value to use instead of nil
//if let inputString = inputStringOptional {
//    let num = Int(inputString) ?? 0
//    print(num)
//}

// MARK: - Closure Practice
// examples #1-3 map, filter, reduce on an array of Ints
// challenge problems #1-3 map, filter, reduce on an array of Strings
// ADS 5.1
let nums = [1, 2, 3, 4, 5]
print(nums)
// 1. map: apply a function to each value in an array to create a new array of equal length
// define a closure to create an array of each value in nums doubled
// [2, 4, 6, 8, 10]
let numsDoubled = nums.map({(value) -> Int in
    return value * 2
})
print(numsDoubled)
// syntactic sugar (shorthand)
print(nums.map{$0 * 2})

// 2. filter: apply an inclusion criteria to each value in the array to create a second array (might be smaller)
// define a closure to create an array of only the even numbers in nums
let numsEven = nums.filter({(value) -> Bool in
    if value % 2 == 0 {
        return true
    }
    return false
})
print(numsEven)
print(nums.filter{$0 % 2 == 0})

// 3. reduce: combines all values in an array into one value
// define a closure to compute the product of the values in nums
// 120
let product = nums.reduce(1, { (productSoFar, value) -> Int in
    return productSoFar * value
})
print(product)

// TODO: shorthand for reduce
print(nums.reduce(1) {$0 * $1})

// closure challenge problems
// on an array of strings
let sentence = ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
// 1. use a closure to create an array of the words with "o" in them
let wordsWithO = sentence.filter({ (word) -> Bool in
    return word.contains("o")
})
print(wordsWithO)
// synactic sugar
print(sentence.filter{$0.contains("o")})

// 2. use a closure to create an array of the words in all CAPS
print(sentence.map{$0.uppercased()})

// 3. use a closure to create a string containing the first letter of each word
// "tqbfjotld"
print(sentence.reduce("") {$0 + String($1[$1.startIndex])})
