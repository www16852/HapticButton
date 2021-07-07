//
//  OrangeHapticButton.swift
//  HapticButtonDemo
//
//  Created by cm0673 on 2021/7/6.
//

import UIKit

class OrangeHapticButton: HapticButton {
    
    override var pressColor: UIColor? {#colorLiteral(red: 0.8011189103, green: 0.3820436895, blue: 0.006879171822, alpha: 1)}
    override var originColor: UIColor? {.init(r: 255, g: 120, b: 0, a: 1)}
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
}

extension UIColor {
    convenience init(r: Int, g: Int, b: Int, a: Float) {
        assert(r >= 0 && r <= 255, "Invalid red component")
        assert(g >= 0 && g <= 255, "Invalid green component")
        assert(b >= 0 && b <= 255, "Invalid blue component")
        assert(a >= 0 && a <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a))
    }
}
