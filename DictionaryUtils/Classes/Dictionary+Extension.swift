//
//  Dictionary+Extension.swift
//  Pods
//
//  Created by Will Powell on 01/04/2017.
//
//

import Foundation

public extension Dictionary where Key: ExpressibleByStringLiteral {
    public func read(_ param: String) -> Any? {
        var paramParts = param.components(separatedBy: ".")
        var currentElement:[AnyHashable : Any] = self
        for i in 0..<paramParts.count {
            let part = paramParts[i]
            if i < paramParts.count - 1 {
                guard let childElement = currentElement[part] as! Dictionary<AnyHashable, Any>? else {
                    return nil
                }
                currentElement = childElement
            }else{
                return currentElement[part]
            }
        }
        return nil
    }
    
    public func readString(_ param: String) -> String? {
        return self.read(param) as? String
    }
    
    public func readInt(_ param: String) -> Int? {
        return self.read(param) as? Int
    }
    
    public func readBool(_ param: String) -> Bool? {
        return self.read(param) as? Bool
    }
}
