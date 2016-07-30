//
//  FileReader.swift
//  AnagramsForAWord
//
//  Created by Ashley Barrett on 17/04/2016.
//  Copyright © 2016 Ashley Barrett. All rights reserved.
//

import Foundation

public class FileReader
{
    private let path : String
    
    public init(path: String) throws
    {
        guard path.characters.count > 0 else { throw FileError.EmptyPath }
        self.path = path
    }
    
    public func readFile() throws -> [String]
    {
        var allLines = [String]()
       
        do
        {
            let linesAsString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            allLines = linesAsString.componentsSeparatedByString("\n")
        }
        catch
        {
            throw FileError.InvalidPath
        }
        
        return allLines
    }
}
