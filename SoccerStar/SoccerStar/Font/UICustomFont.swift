//
//  UICustomFont.swift
//  SoccerStar
//
//  Created by Amar Gawade on 3/7/21.
//

import Foundation
import UIKit

class UICustomFont {
    static let genericCompactSpacing: CGFloat = 20
    static let genericRegularSpacing: CGFloat = 30
    
    static let genericFont = UIFont.systemFont(ofSize: 14, weight: .medium
    )
    static var genericSpacing: CGFloat {
        return LayoutGuide.shared.isCompactLayout() ? genericCompactSpacing : genericRegularSpacing
    }
    
    static var loginFieldSpacing: CGFloat {
        return LayoutGuide.shared.isCompactLayout() ? genericCompactSpacing : genericRegularSpacing
    }
    
    static let dynamicWhite = UIColor.black
    static let dynamicBlack = UIColor.black
}
