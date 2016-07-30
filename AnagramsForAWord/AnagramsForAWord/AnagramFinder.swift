//
//  AnagramFinder.swift
//  AnagramsForAWord
//
//  Created by Ashley Barrett on 14/04/2016.
//  Copyright © 2016 Ashley Barrett. All rights reserved.
//

import Foundation

public class AnagramFinder
{
    private var path: String
    private var hashTable = [Int : [String]]()
    
    public init(path : String)
    {
        self.path = path
    }
    
    public func readWords() throws
    {
        let fr = try FileReader(path: path)
        let lines = try fr.readFile()
            
        for word in lines
        {
            let lowerCase = word.lowercaseString
            
            let hashValue = getHashValue(lowerCase)
            
            var bucket = hashTable[hashValue] != nil ? hashTable[hashValue]! : [String]()
            
            bucket.append(lowerCase)
            
            hashTable[hashValue] = bucket
        }
    }
    
    public func getAnagramsForWord(word : String) -> [String]
    {
        guard word.characters.count > 0 else { return [String]() }
        
        let hashValue = getHashValue(word.lowercaseString)
        
        var anagrams = [String]()
        
        if hashTable[hashValue] != nil
        {
            anagrams = hashTable[hashValue]!
        }

        return anagrams
    }
    
    private func getHashValue(word : String) -> Int
    {
        let wordAsArray = word.characters.map { String($0) }
        
        let ordered = wordAsArray.sort { (x, y) -> Bool in
            return x < y
        }

        return ordered.joinWithSeparator("").hashValue;
    }
}
