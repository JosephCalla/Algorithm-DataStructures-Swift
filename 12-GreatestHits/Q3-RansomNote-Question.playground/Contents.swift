import UIKit

/*
 ___                               _  _     _       _
| _ \__ _ _ _  ___ ___ _ __  ___  | \| |___| |_ ___| |
|   / _` | ' \(_-</ _ \ '  \/ -_) | .` / _ \  _/ -_)_|
|_|_\__,_|_||_/__/\___/_|_|_\___| |_|\_\___/\__\___(_)

 // Challenge: Write a ransom note by cutting letters out of the available
 // magazines and pasting them together to form a letter. Given an arbitrary
 // ransom note string and another string containing all the contents of all
 // the magazines, write a function that will return true if the ransom
 // note can be made from the magazines; otherwise, it will return false.
 // Every letter found in the magazine string can only be used once in your
 // ransom note.

 // Assumption: We don't need to count spaces in our note
 */

//func canWrite(note: String, letters: String) -> t Bool {
//
//
//    return false
//
//
//}

//canWrite(note: "Pay", letters: "yaP")
//canWrite(note: "Pay", letters: "yaP a")
//canWrite(note: "Pay me $1000", letters: "ayPem0001$")
//canWrite(note: "Pay", letters: "Pa")
//


//class Solution {
//    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
//        var container = nums
//
//        if !container.contains(where: { $0 == target }) {
//            container.append(target)
//            container = container.sorted(by: { $0 < $1 })
//        }
//
//        for (index, num) in container.enumerated() {
//            if num == target {
//                return index
//            }
//        }
//        return 0
//    }
//}


//let solution = Solution()
//solution.searchInsert([1,3,5,6], 2)
//solution.searchInsert([1,3,5,6], 7)

//
//class Solution {
//    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
//        var container = nums
//        var previusIndex = 0
//
//        for (index, _) in container.enumerated() {
//            if container[previusIndex] < target && container[index] != target {
//                if !container.contains(where: { $0 == target }) {
//                    container.append(target)
//                    container = container.sorted(by: { $0 < $1 }) // sorted
//                }
//            }
//            previusIndex = index
//        }
//
//        for (index, num) in container.enumerated() {
//            if num == target {
//                return index
//            }
//        }
//        return 0
//    }
//}

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */
func isBadVersion(_ n: Int) -> Bool {
    return true
}

class Solution {
    func firstBadVersion(_ n: Int) -> Int {
        var dic = [Int : Bool]()
        var firstBadVersion = 0
        
        for item in 1...n {
            dic[item] = isBadVersion(item)
            // print("\(dic)")
        }
        
        var sortedDic = dic.sorted(by: { $0.key < $1.key})
        
        // print("\(sortedDic)")
        firstBadVersion = sortedDic.first(where: { $0.value == true })?.key ?? 1
        return firstBadVersion
    }
}

let solution = Solution()
solution.firstBadVersion(2)
