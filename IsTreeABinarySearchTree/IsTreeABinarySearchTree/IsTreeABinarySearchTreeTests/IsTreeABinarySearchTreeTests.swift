//
//  IsTreeABinarySearchTreeTests.swift
//  IsTreeABinarySearchTreeTests
//
//  Created by Ashley Barrett on 31/07/2016.
//
//

import XCTest

public class IsTreeABinarySearchTreeTests: XCTestCase {
    public func test_SingleElementBSTReturnsTrue(){
        let bst = Node(value: 5, left: nil, right: nil)
        let sut = BinarySearchTree()
        let result = sut.isValid(bst)
        XCTAssertEqual(result, true)
    }
    
    public func test_ReturnsTrue(){
        let bstLevelTwoLeft = Node(value: 3, left: Node(value: 2), right: Node(value: 4))
        let bstLevelTwoRight = Node(value: 7, left: Node(value: 6), right: nil)
        let bstLevelOne = Node(value: 5, left: bstLevelTwoLeft, right: bstLevelTwoRight)
        
        let sut = BinarySearchTree()
        let result = sut.isValid(bstLevelOne)
        XCTAssertEqual(result, true)
    }
    
    public func test_ReturnsFalse(){
        let bstLevelTwoLeft = Node(value: 3, left: Node(value: 2), right: Node(value: 6))
        let bstLevelTwoRight = Node(value: 8, left: Node(value: 7), right: nil)
        let bstLevelOne = Node(value: 5, left: bstLevelTwoLeft, right: bstLevelTwoRight)
        
        let sut = BinarySearchTree()
        let result = sut.isValid(bstLevelOne)
        XCTAssertEqual(result, false)
    }
}
