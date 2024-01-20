//
//  IdGenerator.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 20/01/24.
//

import Foundation

class IdGenerator {
    static func generate(index: Int, name: String) -> Int {
        let id = index + name.hashValue
        return id
    }
    
    static func generate(index: Int, name: String) -> String {
        let id = Data("\(index)\(name)".utf8).base64EncodedString()
        return id
    }
}
