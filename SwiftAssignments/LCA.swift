//
//  LCA.swift
//  Union-Find
//
//  Created by Carlos andres Diaz bravo  on 2020-02-26.
//  Copyright © 2020 Carlos andres Diaz bravo . All rights reserved.
//

import Foundation


func LCA() {

   
    let node = Int(readLine()!)!
    var tree = [[Int]](repeating: [], count: node + 1)
        
        for _ in 0..<node - 1 {
            let edge = readLine()!.split(separator: " ")
            var u = Int(edge[0])!
            var v = Int(edge[1])!
            tree[u].append(v)
            tree[v].append(u)
    }
    var Lines: [[Int]] = []
    
    
    let m = Int(readLine()!)!
        
        for _ in 0..<m {
            let splited = readLine()!.split(separator: " ")
            Lines.append([Int(splited[0])!, Int(splited[1])!])
    }
    
    func commonA(_ search: Int, _ target: [Int], _ seen: inout Set<Int>, _
        
        
        res: inout Int?) -> Int {
            guard res == nil else { return 0 }
            guard tree.count > search else { return 0 }
        seen.insert(search)
            
        var sum: Int = target.contains(search) ? 1 : 0
            for n in tree[search] {
            if seen.contains(n) { continue }
            sum += commonA(n, target, &seen, &res)
        }
        if sum > 1 {
            res = search
            sum = 1
        }
        
        return sum
    }

    print("Output")
    
    
    
    }

