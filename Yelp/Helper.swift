//
//  Helper.swift
//  Yelp
//
//  Created by Nabib El-RAHMAN on 9/22/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit


extension NSArray {

    func combine(separator: String) -> String{
        return combine(separator, {(item: AnyObject)
            -> String in return "\(item)"
        })
    }


    func combine(separator: String, closure: (item: AnyObject) -> String) -> String {
        var str : String = ""
        for (idx, item) in enumerate(self) {
            str += closure(item: item)
            if idx < self.count-1 {
                str += separator
            }
        }
        return str
    }
}

class Helper {
   
    class func arrayCombine(arr: NSArray, sep: String) -> String {
        return arr.combine(sep)
    }

    class func arrayCombine(arr: NSArray, sep: String, closure: (item: AnyObject) -> String) -> String {
        return arr.combine(sep, closure)
    }
    
   
}
