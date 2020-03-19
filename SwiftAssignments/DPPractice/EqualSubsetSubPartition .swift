//
//  EqualSubsetSubPartition .swift
//  SwiftAssignments
//
//  Created by Carlos andres Diaz bravo  on 2020-03-17.
//  Copyright © 2020 Carlos andres Diaz bravo . All rights reserved.
//

import Foundation
class Solutionsuset {
     
    var mark = [String : Bool]()
     func canPartition(_ nums: [Int]) -> Bool {
         let count = nums.count
         var sum = 0
        for i in 0..<count {
            sum += nums[i]
         }

        if sum & 1 == 1 {
            return false
        }
        return reachTarget(nums, count, 0, sum / 2)
    }

     func reachTarget(_ nums: [Int], _ count: Int, _ index: Int, _ target: Int) -> Bool {
        let key = "\(index),\(target)"
        if let _ = mark[key] {
            return false
         }
         if target == 0 {
            return true
        } else if target < 0 {
            return false
        }
         if index == count {
            return false
         }

         if reachTarget(nums, count, index + 1, target - nums[index]) {
            return true
         }
         if reachTarget(nums, count, index + 1, target) {
             return true
         }

         mark[key] = false
         return false
     }
 }
