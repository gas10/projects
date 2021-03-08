//
//  ParsingUtility.swift
//  SoccerStar
//
//  Created by Amar Gawade on 3/7/21.
//

import Foundation
class ParsingUtility {
    static func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
