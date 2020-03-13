//
//  Set6.swift
//  SwiftAssignments
//
//  Created by Carlos andres Diaz bravo  on 2020-03-10.
//  Copyright © 2020 Carlos andres Diaz bravo . All rights reserved.
//

import Foundation

//class Solution6 {
//
//    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
//
//        var FirstLine = Array(repeating:[Int](), count: numCourses)
//        var StartArray = Array(repeating:0, count:numCourses)
//
//        for edge in prerequisites {
//            let start = edge[1]
//            let end = edge[0]
//
//            FirstLine[start].append(end)
//            StartArray[end] += 1
//        }
//        var stack = [Int]()
//        for vertice in 0 ..< StartArray.count {
//            if StartArray[vertice] == 0 {
//                stack.append(vertice)
//            }
//        }
//        var result = [Int]()
//        while stack.count > 0 {
//
//            let vertice = stack.popLast()!
//            result.append(vertice)
//            let connectedList = FirstLine[vertice]
//                for connectedVertex in connectedList {
//                StartArray[connectedVertex] -= 1
//                if StartArray[connectedVertex] == 0 {
//                    stack.append(connectedVertex)
//                }
//            }
//        }
//        if result.count != numCourses {
//            return [Int]()
//        }
//        return vertice
//
//    }
//
//    func scheduleCourse(_ courses: [[Int]]) -> Int {
//            guard courses.count > 0 else {
//                return 0;
//            }
//
//            let Course = courses.sorted { (value1, value2) -> Bool in
//                if value1.count > 1 && value2.count > 1 {
//                    if value1[1] == value2[1] {
//                        return value1[0] < value2[0];
//                    }
//                    return value1[1] < value2[1];
//                }
//                else {
//                    return false;
//                }
//            }
//
//            var list = [Int]();
//            var day = 0;
//            for i in 0 ..< Course.count {
//                let value = Course[i];
//                if value.count > 1 {
//
//                    if day + value[0] <= value[1] {
//                        list.append(value[0]);
//                        day += value[0];
//                    }
//                    else
//                    {
//
//                        list.sort();
//                        if let lastValue = list.last , lastValue > value[0]{
//                            day -= lastValue;
//                            list.removeLast();
//                            list.append(value[0]);
//                            day += value[0];
//                        }
//                    }
//                }
//            }
//            return list.count;
//        }
//
//
//    }
//
