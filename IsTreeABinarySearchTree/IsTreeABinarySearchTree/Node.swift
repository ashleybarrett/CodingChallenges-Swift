//
//  Node.swift
//  IsTreeABinarySearchTree
//
//  Created by Ashley Barrett on 31/07/2016.
//
//

import Foundation

public class Node{
    public let value: Int
    public let left: Node?
    public let right: Node?
    
    public init(value: Int, left: Node?, right: Node?){
        self.value = value
        self.left = left
        self.right = right
    }
    
    public init(value: Int){
        self.value = value
        self.left = nil
        self.right = nil
    }
}