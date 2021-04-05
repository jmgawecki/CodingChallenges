//
//  LinkedList.swift
//  CodingChallenges
//
//  Created by Jakub Gawecki on 04/04/2021.
//

import Foundation

class LinkedListNode<T> {
    var value: T
    
    var next: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    var start: LinkedListNode<T>?
    
    func printNodes() {
        var currentNode = start
        
        // that executes until list is over, and it when currentNode's value is nil. At the end we assign node.next that is optional to the currentNode. Meaning where there are no more nodes, currentNode will equal nil. Then while is not executed anymore and the function is terminated.
        while let node = currentNode {
            print(node, terminator: " ")
            currentNode = node.next
        }
    }
    
    
    func returnMidNode() -> LinkedListNode<T>? {
        var slow = start
        var fast = start
        // 1 2 3 4
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}

extension LinkedList {
    func addString(_ string: String) {
        
    }
}




































//
//class LinkedListNode<T> {
//    var value: T
//
//    var next: LinkedListNode?
//
//    init(value: T) {
//        self.value = value
//    }
//}
//
//
//class LinkedList<T> {
//    var start: LinkedListNode<T>?
//
//    func printNodes() {
//        var currentNode = start
//
//        while let node = currentNode {
//            print(node.value, terminator: " ")
//            currentNode = node.next
//        }
//    }
//}


