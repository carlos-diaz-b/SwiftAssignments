//
//  Set7.swift
//  SwiftAssignments
//
//  Created by Carlos andres Diaz bravo  on 2020-03-10.
//  Copyright © 2020 Carlos andres Diaz bravo . All rights reserved.
//

import Foundation
class Solution {
   
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        let n = costs.count / 2
        var i0 = Int(0), i1 = Int(0)
        let costsSorted = costs.sorted(by: { abs($0[0] - $0[1]) > abs($1[0] - $1[1]) })
        var result: Int = 0
        for cost in costsSorted {
            if cost[0] <= cost[1] && i0 < n || i1 == n {
                result += cost[0]
                i0 += 1
            } else {
                result += cost[1]
                i1 += 1
            }
        }
        return result
        
    }
    
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        guard tasks.count > 0 else {
            return 0
        }
        
        let taskFreqs = Dictionary(tasks.map { ($0, 1) }, uniquingKeysWith: +)
        let sortedTasks = taskFreqs.keys.sorted { return taskFreqs[$0]! > taskFreqs[$1]! }
        var mostFreqCount = 0
          for sortedTask in sortedTasks {
            if taskFreqs[sortedTask] != taskFreqs[sortedTasks[0]] {
                break
            }
            
            mostFreqCount += 1
        }
        
        return max(tasks.count, (taskFreqs[sortedTasks[0]]! - 1) * (n + 1) + mostFreqCount)
    }
        
   
    
   // func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
           

    //  }

    
    func partitionLabels(_ S: String) -> [Int] {
            var anchor = 0, j = 0
            var ans: [Int] = []
            var lastIndex: [Character: Int] = [:]
            
            for (i, char) in S.enumerated() {
                lastIndex[char] = i
            }

            for (i, char) in S.enumerated() {
                j = max(j, lastIndex[char] ?? 0)
                if i == j {
                    ans.append(i-anchor+1)
                    anchor = i + 1
                }
            }
            return ans
            
        }
    
    
    }
        
    

