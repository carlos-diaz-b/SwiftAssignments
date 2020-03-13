//
//   LongestIncreasingSubsequence.swift
//  SwiftAssignments
//
//  Created by Carlos andres Diaz bravo  on 2020-03-13.
//  Copyright © 2020 Carlos andres Diaz bravo . All rights reserved.
//

import Foundation



func lengthOfLIS(_ nums: [Int]) -> Int {
    
    let count = nums.count;
    if count <= 1 {
        return count;
    }
    var lengths = [Int].init(repeating: 0, count: count);
    var counts = [Int].init(repeating: 1, count: count);
    
   
    for j in 0 ..< count {
        for i in 0 ..< j {
            if nums[i] < nums[j] {
                if lengths[i] >= lengths[j] {
                    lengths[j] = lengths[i] + 1;
                    counts[j] = counts[i];
                }
                else if lengths[i] + 1 == lengths[j] {
                    counts[j] += counts[i];
                }
            }
        }
    }
    
    var answer = 0,longest = 0;
    for length in lengths {
        longest = max(longest, length);
    }
    for i in 0 ..< count {
        if lengths[i] == longest {
            answer += counts[i];
        }
    }
    
    return answer;
}
    

