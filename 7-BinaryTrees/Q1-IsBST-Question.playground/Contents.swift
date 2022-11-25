import Foundation
import XCTest

/*
 CheckBST
 https://www.hackerrank.com/challenges/ctci-is-binary-search-tree/problem
 
 Given the root node of a binary tree, determine if it is a binary search tree.
 
 The Node class is defined as follows:
    class Node {
        int data;
        Node left;
        Node right;
     }
*/

class Node {
    var key: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.key = data
    }
}

func checkBST(root: Node?) -> Bool {
    return isBTS(root, nil, nil)
}

func isBTS(_ node: Node?, _ min: Int?, _ max: Int?) -> Bool {
    print("Comparing: \(node!.key) min:\(min!) max: \(max!)")
    
    // If nil we hit the end of our branch - OK
    guard let node = node else {
        return true
    }
    
    // Else check if min < parent
    if let min = min, node.key <= min {
        print("min: \(min) key: \(node.key)")
        return false
    }
    
    // Check if max > parent
    if let max = max, node.key >= max {
        print("Max: \(max) key: \(node.key)")
        return false
    }
    
    // if min max ok, got the next level passing in min/max and parent
    return isBTS(node.left, min, node.key) && isBTS(node.right, node.key, max)
}

class Tests: XCTestCase {
    func testIsValid1() {
        let root = Node(4)
        root.left = Node(2)
        root.right = Node(6)
        root.left?.left = Node(1)
        root.left?.right = Node(3)
        root.right?.left = Node(5)
        root.right?.right = Node(7)
        
        XCTAssertTrue(checkBST(root: root))
    }
    
//    func testIsNotValid1() {
//        let root = Node(3)
//        root.left = Node(2)
//        root.right = Node(4)
//        root.left?.left = Node(1)
//        root.right?.left = Node(5)
//        root.right?.right = Node(6)
//
//        XCTAssertFalse(checkBST(root: root))
//    }
}
