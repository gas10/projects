//
//  LayoutGuide.swift
//  SoccerStar
//
//  Created by Amar Gawade on 3/7/21.
//

import Foundation

open class LayoutGuide: NSObject {
    private override init() {
        
    }
    
    public static let shared = LayoutGuide()
    
    open func isCompactLayout() -> Bool {
        return true
    }
    
    open func isHorizontalCompactLayout() -> Bool {
        return true
    }
    
    open func isVerticalCompactLayout() -> Bool {
        return true
    }
    
    open func isCompactWindow() -> Bool {
        return true
    }
    
    open func isHorizontalCompactWindow() -> Bool {
        return true
    }
    
    open func isVerticalCompactWindow() -> Bool {
        return true
    }
    
    open func isiPhoneLayout() -> Bool {
        return true
    }
}
