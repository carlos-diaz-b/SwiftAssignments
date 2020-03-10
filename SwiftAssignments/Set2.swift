//
//  Set2.swift
//  Union-Find
//
//  Created by Carlos andres Diaz bravo  on 2020-03-09.
//  Copyright © 2020 Carlos andres Diaz bravo . All rights reserved.
//

import Foundation


func CPermutation() {
    
    let testCases: Int = Int(readLine()!)!
    for _ in 0..<testCases {
        
        let n: Int = Int(readLine()!)!
        let e = readLine()!.split(separator: " ")
        var uf = unionFind(n)
        
        
        for j in 0..<n {
            if uf.plug(j, Int(e[j])! - 1) {
                continue
            }
            uf.join(j, Int(e[j])! - 1)
        }
        print(uf.count)
    }
}

func Repeatsequence() {
    let input: [Substring]  = readLine()!.split(separator: " ")
    var A: Int = Int(input[0])!
    let P: Int = Int(input[1])!
    var dict: [Int:Int] = [:]
    
    
    func backup(num: Int, power: Int) -> Int {
        
        var quotient: Int = num
        var sum: Double = 0
        while(quotient != 0) {
            sum += pow(Double(quotient % 10), Double(power))
            quotient = quotient / 10
        }
        
        return Int(sum)
    
    }
    
    
    var index: Int = 0
    while !dict.keys.contains(A) {
        dict[A] = index
        A = backup(num: A, power: P)
        index += 1
    }
    
    
    print(dict[A]!)
    
    
    
    
}
