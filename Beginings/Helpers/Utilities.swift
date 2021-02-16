//
//  Utilities.swift
//  Beginings
//
//  Created by rob ord on 08/02/2021.
//
import UIKit
import Foundation
 
class Utilities{
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
