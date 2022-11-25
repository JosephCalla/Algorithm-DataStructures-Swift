import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkList {
    private var head: Node?
    
    func addFront(_ data: Int) { // O(1)
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }
    
    func getFirst() -> Int? { // O(1)
        if head == nil {
            return nil
        }
        return head!.data
    }
    
    func addBack(_ data: Int) { // O(n)
        let newNode = Node(data)
        if head == nil {
            head = newNode
            return
        }
        var currentNode = head
        
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        currentNode!.next = newNode
    }
    
    func getLast() -> Int? { // O(n)
        if head == nil {
            return nil
        }
        var currentNode = head
        
        while (currentNode?.next != nil) {
            currentNode = currentNode?.next
        }
        
        return currentNode?.data
    }
    
    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
        
        let newNode = Node(data)
        var currentNode = head
        
        for _ in 0..<position - 1 {
            currentNode = currentNode?.next
        }
        print("After looping currentNode: \(currentNode!.data)") // head(4) -> 1 -> 2
        newNode.next = currentNode?.next // 9 -> 3 -> 5
        currentNode?.next = newNode
    }
    
    func deleteFirst() { // O(1)
        head = head?.next
    }
    
    func deleteLast() { // O(n)
        var node = head
        var previousNode: Node?
        
        while (node?.next != nil) {
            previousNode = node
            node = node?.next
        }
        previousNode?.next = nil
    }
    
    func delete(at position: Int) {
        var node = head
        var previousNode: Node?

        if position == 0 {
            head = head?.next
            return
        }
        
        for _ in 0..<position {
            previousNode = node
            node = node?.next
        }
        
        previousNode?.next = node?.next
    }
    
    var isEmpty: Bool {
        return head?.data == nil
    }
    
    func clear() {
        head = nil
    }
    
    func printLinkedList() {
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
}

let linkedList = LinkList()
linkedList.addFront(3)
linkedList.addFront(2)
linkedList.addFront(1)
linkedList.printLinkedList()


linkedList.addFront(4)
linkedList.printLinkedList()


linkedList.getFirst()
linkedList.printLinkedList()


linkedList.addBack(5)
linkedList.printLinkedList()


linkedList.getFirst()
linkedList.getLast()
linkedList.printLinkedList()


linkedList.insert(position: 3, data: 9)
linkedList.printLinkedList()


linkedList.deleteFirst()
linkedList.printLinkedList()


linkedList.deleteLast()
linkedList.printLinkedList()


linkedList.delete(at: 2)
linkedList.printLinkedList()


linkedList.clear()
linkedList.isEmpty
linkedList.printLinkedList()

linkedList.insert(position: 0, data: 1)
linkedList.isEmpty
linkedList.printLinkedList()


// WHAT YOU NEED TO KNOW
/*
 - Anything to do with the front is O(1)
 like - addFront/ getFirst/ deleteFirst
 
 - Anything you need to walk O(n)
 like addBack/ getBack/ deleteLast
 
 - No random access
 - Always the right size
 
 */
