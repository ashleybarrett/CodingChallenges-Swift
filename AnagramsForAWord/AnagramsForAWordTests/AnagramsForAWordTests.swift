//
//  AnagramsForAWordTests.swift
//  AnagramsForAWordTests
//
//  Created by Ashley Barrett on 16/04/2016.
//  Copyright © 2016 Ashley Barrett. All rights reserved.
//
//  My attempt to solve this problem: http://www.blackrabbitcoder.net/archive/2015/07/28/little-puzzlersndashlist-all-anagrams-for-a-word.aspx

import XCTest

var bs = false;
let path = "words.txt"
let wr = AnagramFinder(path: path)

public class AnagramsForAWordTests: XCTestCase
{
    public override func setUp()
    {
        if(!bs)
        {
            do
            {
                try wr.readWords()
                bs = true
            }
            catch
            {
            }
        }
    }
    
    public func test_Post()
    {
        let word = "post"
        let expectedArray = ["post", "spot", "stop", "tops"]
        
        let anagrams = wr.getAnagramsForWord(word)

        XCTAssertTrue(compareArrays(expectedArray, right: anagrams))
    }
    
    public func test_Tops()
    {
        let word = "tops"
        let expectedArray = ["post", "spot", "stop", "tops"]
        
        let anagrams = wr.getAnagramsForWord(word)

        XCTAssertTrue(compareArrays(expectedArray, right: anagrams))
    }
    
    public func test_Bustle()
    {
        let word = "bustle"
        let expectedArray = ["bustle", "sublet", "subtle"]
        
        let anagrams = wr.getAnagramsForWord(word)

        XCTAssertTrue(compareArrays(expectedArray, right: anagrams))
    }
    
    public func test_Non_Word()
    {
        let word = "djhufhefhwufhufh"
        let expectedArray = [String]()
        
        let anagrams = wr.getAnagramsForWord(word)

        XCTAssertTrue(compareArrays(expectedArray, right: anagrams))
    }
    
    public func test_Is()
    {
        let word = "is"
        let expectedArray = ["is", "si"]
        
        let anagrams = wr.getAnagramsForWord(word)
        
        XCTAssertTrue(compareArrays(expectedArray, right: anagrams))
    }
    
    public func test_Canoe()
    {
        let word = "canoe"
        let expectedArray = ["canoe", "ocean", "acone"]
        
        let anagrams = wr.getAnagramsForWord(word)
        
        XCTAssertTrue(compareArrays(expectedArray, right: anagrams))
    }
    
    public func test_Large()
    {
        let word = "large"
        let expectedArray = ["ergal", "large", "argel", "glare", "garle" ,"lager", "regal"]
        
        let anagrams = wr.getAnagramsForWord(word)
        
        XCTAssertTrue(compareArrays(expectedArray, right: anagrams))
    }
    
    public func test_Sleuth()
    {
        let word = "sleuth"
        let expectedArray = ["sleuth", "hustle"]
        
        let anagrams = wr.getAnagramsForWord(word)

        XCTAssertTrue(compareArrays(expectedArray, right: anagrams))
    }
    
    public func test_Zoned()
    {
        let word = "zoned"
        let expectedArray = ["zoned", "dozen"]
        
        let anagrams = wr.getAnagramsForWord(word)
        
        XCTAssertTrue(compareArrays(expectedArray, right: anagrams))
    }
    
    private func compareArrays(left : [String], right : [String]) -> Bool
    {
        var matches = left.count == right.count
        
        if(matches)
        {
            for item in left
            {
                if(!right.contains(item))
                {
                    matches = false
                    break
                }
            }
        }
        
        return matches;
    }
}
