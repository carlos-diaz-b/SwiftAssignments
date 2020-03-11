//
//  Set3.swift
//  SwiftAssignments
//
//  Created by Carlos andres Diaz bravo  on 2020-03-09.
//  Copyright © 2020 Carlos andres Diaz bravo . All rights reserved.
//

import Foundation



func tomatoFarm() {
        var firstLine: [Substring] = readLine()!.split(separator: " ")
        
    
        var x: Int = Int(firstLine[0])!
        var y: Int = Int(firstLine[1])!
        var sum: Int = 0

    
    var sa: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: x), count: y)
    
    var sArray: [[Int]] = []
    
    
    for i in 0..<y {
        let row: [Substring] = readLine()!.split(separator: " ")
        
        for j in 0..<x {
            sa[i][j] = Int(row[j])!
            if sa[i][j] > -1 {
                sum += 1
            }
            if sa[i][j] == 1 {
                sArray.append([i, j])
            }
        }
    }
    
    func aux(row: Int, col: Int, array: inout [[Int]]) -> Int {
        
        guard row > -1 && row < y else { return 0 }
        guard col > -1 && col < x else { return 0 }
        guard array[row][col] == 0 else { return 0 }
            array[row][col] = 1
            return 1
    }
    
    var days: Int = 0
    
    
    func score(points: [[Int]], array: [[Int]]) -> Int {
        let Tarray: [Int] = array.flatMap {$0.filter {$0 > 0}}
        if Tarray.reduce(0, +) == sum {
            return days
        }

        var step: [[Int]] = []
       
        var NA: [[Int]] = array
        for p in points {
            if aux(row: p[0] - 1, col: p[1], array: &NA) > 0 {
                step.append([p[0] - 1, p[1]])
            }
            if aux(row: p[0], col: p[1] + 1, array: &NA) > 0 {
                step.append([p[0], p[1] + 1])
            }
            if aux(row: p[0] + 1, col: p[1], array: &NA) > 0 {
                step.append([p[0] + 1, p[1]])
            }
            if aux(row: p[0], col: p[1] - 1, array: &NA) > 0 {
                step.append([p[0], p[1] - 1])
            }
        }
        if step.count < 1 { return -1 }
        days += 1
        return score(points: step, array: NA)
    }
    print(score(points: sArray, array: sa))
}



func bridges() {
  
    
    var x: Int = Int(readLine()!)!
    
    var layout: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: x), count: x)
    for i in 0..<x {
        let row: [Substring] = readLine()!.split(separator: " ")
        for j in 0..<x {
            layout[i][j] = Int(row[j])!
        }
    }
    
    
    func join(row: Int, col: Int, next: inout Set<[Int]>) {
       
        guard row > -1 && row < x else { return }
        guard col > -1 && col < x else { return }
        guard layout[row][col] > -1 else { return }
        guard layout[row][col] != 0 else {
            next.insert([row, col])
            return
        }
        layout[row][col] = -1
        
        let array: [[Int]] = [[-1, 0], [0, 1], [1, 0], [0, -1]]
            for a in array {
            join(row: row + a[0], col: col + a[1], next: &next)
        }
    }
    
    
    var Next: [Set<[Int]>] = []
    for i in 0..<x {
        for j in 0..<x {
            if layout[i][j] == 1 {
                var next: Set<[Int]> = []
                join(row: i, col: j, next: &next)
                Next.append(next)
            }
        }
    }
    
    func grow(row: Int, col: Int) -> [Int]? {
        
        guard row > -1 && row < x else { return nil }
        guard col > -1 && col < x else { return nil }
        guard layout[row][col] == 0 else { return nil }
        return [row, col]
    }
    
    func aux(changes: [Set<[Int]>], num: Int) -> Int {
        
        var ot: [Set<[Int]>] = []
        
        for change in changes {
            var place: Set<[Int]> = []
            
            for c in change {
                if layout[c[0]][c[1]] > 0 {
                    return layout[c[0]][c[1]] + num - 1
                }
                layout[c[0]][c[1]] = num
                let array: [[Int]] = [[-1, 0], [0, 1], [1, 0], [0, -1]]
                for a in array {
                    if let next: [Int] = grow(row: c[0] + a[0], col: c[1] + a[1]) {
                        if change.contains(next) { continue }
                        place.insert(next)
                    }
                }
            }
            ot.append(place)
        }
        return aux(changes: ot, num: num + 1)
    }
    
    
    print(aux(changes: Next, num: 1))
}
