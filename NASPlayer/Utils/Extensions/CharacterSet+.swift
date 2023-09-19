//
//  CharacterSet+.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import Foundation

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
