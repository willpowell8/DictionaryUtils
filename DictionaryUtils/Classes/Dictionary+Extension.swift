//
//  Dictionary+Extension.swift
//  Pods
//
//  Created by Will Powell on 01/04/2017.
//
//

import Foundation

public enum DictionaryError:Error {
    case invalidQueryString
    case noMatchInArray
    case canNotRouteThroughArrayWithMultipleResults
}

public extension Dictionary where Key: ExpressibleByStringLiteral {
    public func read(_ param: String) throws -> Any?   {
        var paramParts = param.components(separatedBy: ".")
        var currentElement:[AnyHashable : Any] = self
        for i in 0..<paramParts.count {
            let part = paramParts[i]
            if part.contains("["), part.contains("]") {
                let parts = part.components(separatedBy: "[")
                if parts.count == 2 {
                    guard let ary = currentElement[parts[0]] as? [[AnyHashable:Any]] else {
                        return nil
                    }
                    let finalSegmentParts = parts[1].components(separatedBy: "]")
                    if finalSegmentParts.count == 2, finalSegmentParts[1] == "" {
                        let finalSegment = finalSegmentParts[0]
                        if let finalSegmentInt = Int(finalSegment), finalSegmentInt>=0 {
                            // is integer in parameter
                            if i < paramParts.count - 1 {
                                currentElement = ary[finalSegmentInt]
                            }else{
                                return currentElement[finalSegmentInt]
                            }
                        }else{
                            // is query string
                            print("Query String")
                            var queryParams = [String:AnyHashable]()
                            let splitParameters = finalSegment.components(separatedBy: ",")
                            splitParameters.forEach({ (item) in
                                let itemParts = item.components(separatedBy: "=")
                                if let itemPartIsInt = Int(itemParts[1]){
                                    queryParams[itemParts[0]] = itemPartIsInt
                                }else{
                                    queryParams[itemParts[0]] = itemParts[1]
                                }
                                
                            })
                            let output = ary.filter({ (item) -> Bool in
                                var isValid = true
                                queryParams.forEach({ (key,value) in
                                    if let itemValue = item[key] as? AnyHashable, itemValue == value {
                                        
                                    }else{
                                        isValid = false
                                    }
                                })
                                return isValid
                            })
                            if output.count == 0{
                                throw DictionaryError.noMatchInArray
                            }
                            if i < paramParts.count - 1 {
                                if output.count == 1 {
                                    currentElement = output[0]
                                }else{
                                    throw DictionaryError.canNotRouteThroughArrayWithMultipleResults
                                }
                            }else{
                                return output
                            }
                        }
                    }else{
                        throw DictionaryError.invalidQueryString
                    }
                }else{
                    throw DictionaryError.invalidQueryString
                }
            }else{
                if i < paramParts.count - 1 {
                    guard let childElement = currentElement[part] as? Dictionary<AnyHashable, Any>? else {
                        throw DictionaryError.invalidQueryString
                    }
                    guard let c = childElement else {
                        throw DictionaryError.invalidQueryString
                    }
                    currentElement = c
                }else{
                    return currentElement[part]
                }
            }
        }
        return nil
    }
    
    public func readString(_ param: String) throws -> String? {
        do{
            return try self.read(param) as? String
        }catch{
            throw error
        }
    }
    
    public func readInt(_ param: String) throws -> Int? {
        do{
            return try self.read(param) as? Int
        }catch{
            throw error
        }
    }
    
    public func readBool(_ param: String) throws -> Bool? {
        do{
            return try self.read(param) as? Bool
        }catch{
            throw error
        }
    }
}
