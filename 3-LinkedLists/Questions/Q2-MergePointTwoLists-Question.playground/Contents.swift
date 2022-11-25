import UIKit

/*
 Find Merge Point of Two Lists
 
 Given pointers to the head nodes of 2 linked lists that merge together at some point, find the node where the two lists merge. The merge point is where both lists point to the same node, i.e. they reference the same memory location. It is guaranteed that the two head nodes will be different, and neither will be NULL. If the lists share a common node, return that node's data value.
 
 Note: After the merge point, both lists will share the same node pointers.
 
 */

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head: Node?) -> Int {
    var len = 0
    var node = head
    while node != nil {
        len += 1
        node = node?.next
    }
    return len
}

func printLinkedList(_ head: Node?) {
    if head == nil { return }
    
    var result = [Int]()
    var node = head
    result.append(node!.data)
    
    while node?.next != nil {
        result.append(node!.next!.data)
        node = node?.next
    }
    
    print(result)
}

func findMergeBrute(headA: Node?, headB: Node?) -> Int? {
    // Here...
    let m = length(headA)
    let n = length(headB)
    
    var currentA = headA

    for _ in 0...m-1 {
        var currentB = headB
        for _ in 0...n-1 {
            let A = currentA?.data
            let B = currentB?.data
//            print("A: \(A ?? 0) B: \(B ?? 0)")
            if A == B {
                return currentA?.data
            }
            
            currentB = currentB?.next
        }
        currentA = currentA?.next
    }
   return nil
}

func findMergeSpaceTime(headA: Node?, headB: Node?) -> Int? {
    // Create a Dict of all nodes of B
    // Use it to loop up each element of A
    
    let m = length(headA)
    let n = length(headB)
    
    var dict = [Int?: Bool]()
    var currentB = headB
    
    for _ in 0...n-1 {
        let B = currentB?.data
        dict[B] = true
        currentB = currentB?.next
    }
    
    var currentA = headA
    for _ in 0...m-1 {
        let A = currentA?.data
        if dict[A] == true {
            return A
        }
        currentA = currentA?.next
    }
    return nil
}

func findMergeInsight(headA: Node?, headB: Node?) -> Int? {
    
    return nil
}
// 1 2 3 4 5 6
let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

// 10 11 12 13 4 5 6

let node11 = Node(11, node4)
let node10 = Node(10, node11)

//length(node10)
//printLinkedList(node10)
//printLinkedList(node1)
//printLinkedList(node10)

//findMergeBrute(headA: node1, headB: node10)
findMergeSpaceTime(headA: node1, headB: node10)
//findMergeInsight(headA: node10, headB: node1)
