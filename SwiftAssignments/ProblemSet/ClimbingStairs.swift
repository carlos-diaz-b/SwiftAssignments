//
//  ClimbingStairs.swift
//  SwiftAssignments
//
//  Created by Carlos andres Diaz bravo  on 2020-03-13.
//  Copyright © 2020 Carlos andres Diaz bravo . All rights reserved.
//

import Foundation
class Stairs {
    func climbStairs(_ n: Int) -> Int {
        if n == 0 || n == 1  {
            return 1
        }
        var stepOne = 1
        var stepTwo = 1
        var result = 0
        for _ in 2...n {
            result = stepOne + stepTwo
            stepTwo = stepOne
            stepOne = result
        }
        return result
        
        
    }
}
