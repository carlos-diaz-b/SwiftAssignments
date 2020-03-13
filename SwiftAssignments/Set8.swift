//
//  Set8.swift
//  SwiftAssignments
//
//  Created by Carlos andres Diaz bravo  on 2020-03-12.
//  Copyright © 2020 Carlos andres Diaz bravo . All rights reserved.
//

import Foundation
class Solution8 {
    
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
      
        
        var timeamount = Array<Array<Int>>(repeating: Array<Int>(repeating: Int.max , count: N + 1), count: N + 1)
        
        for time in times {
            timeamount[time[0]][time[1]] = time[2]
        }
        
        for i in 0...N {
            timeamount[i][i] = 0
        }
        
        for i in 1...N {
            for j in 1...N {
                for k in 1...N {
                    if !(timeamount[j][i] == Int.max || timeamount[i][k] == Int.max) {
                        timeamount[j][k] = min(timeamount[j][k], timeamount[j][i] + timeamount[i][k])
                    }
                }
            }
        }
            var lenght = timeamount[K]
            lenght.removeFirst()
            let maxDistance = lenght.max()!
        
        return maxDistance == Int.max ? -1 : maxDistance
    }
}




