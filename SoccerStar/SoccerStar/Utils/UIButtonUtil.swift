//
//  UIButtonUtil.swift
//  SoccerStar
//
//  Created by Amar Gawade on 3/7/21.
//

import Foundation
import UIKit

class UIButtonUtil {
    static func createUIButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.layer.cornerRadius = 2
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return button
    }
}
