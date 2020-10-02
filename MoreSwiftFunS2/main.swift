//
//  main.swift
//  MoreSwiftFunS2
//
//  Created by Gina Sprint on 10/2/20.
//  Copyright © 2020 Gina Sprint. All rights reserved.
//

import Foundation

print("Hello, World!")

func getPositiveInteger() -> Int {
    print("Enter a positive integer:")
    if let inputString = readLine() {
        if let inputInt = Int(inputString) {
            if inputInt > 0 {
                return inputInt
            }
        }
    }
    return -1
}

let value = getPositiveInteger()
print("got:", value)
