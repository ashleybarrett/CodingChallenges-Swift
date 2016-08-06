//
//  IsTreeABinarySearchTree.swift
//  IsTreeABinarySearchTree
//
//  Created by Ashley Barrett on 31/07/2016.
//
//  My attempt to solve this problem: http://www.blackrabbitcoder.net/BlackRabbitCoder/archive/2015/03/23/little-puzzlersndashis-tree-a-binary-search-tree.aspx

import Foundation

public class BinarySearchTree {
    public func isValid(bst: Node) -> Bool {
        return
            self.isBranchValid(bst, isLeft: true, rootValue: bst.value, isLeftOfRoot: true) &&
            self.isBranchValid(bst, isLeft: false, rootValue: bst.value, isLeftOfRoot: true) &&
            self.isBranchValid(bst, isLeft: true, rootValue: bst.value, isLeftOfRoot: false) &&
            self.isBranchValid(bst, isLeft: false, rootValue: bst.value, isLeftOfRoot: false)
    }
    
    private func isBranchValid(node: Node, isLeft: Bool, rootValue: Int, isLeftOfRoot: Bool) -> Bool {
        var isValid = false
        let branch = isLeft ? node.left : node.right
        
        if let branch = branch {
            isValid =
                (isLeft ? branch.value < node.value : branch.value >= node.value) &&
                (isLeftOfRoot ? branch.value < rootValue : branch.value >= rootValue)
            
            if isValid {
                isValid = self.isBranchValid(branch, isLeft: isLeft, rootValue: rootValue, isLeftOfRoot: isLeftOfRoot)
            }
        }
        else {
            isValid = true
        }
        
        return isValid
    }
}