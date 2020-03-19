//
//  MakeOne.swift
//  SwiftAssignments
//
//  Created by Carlos andres Diaz bravo  on 2020-03-13.
//  Copyright © 2020 Carlos andres Diaz bravo . All rights reserved.
//

import Foundation




func makeone(_ N: [Int]) -> Int {
   
    var result = [Int]()
    var x = false
    var y = 0
   
    for i in (0..<N.count).reversed() {
        let digit = N[i]
        let value = digit + y + (x ? 0 : 1)
        y = 0
        x = true
        let newDigit = value % 10
        y = value / 10
        result.insert(newDigit, at: 0)
    }
    
    if y > 0 {
        result.insert(y, at: 0)
    }
    
return makeone(result)
}
