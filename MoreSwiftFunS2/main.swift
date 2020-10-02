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
let value = try? getPositiveInteger()
print("got:", value)
