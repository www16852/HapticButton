//
//  HapticButton.swift
//  HapticButtonDemo
//
//  Created by cm0673 on 2021/7/6.
//

import UIKit

/// 觸覺設計的button
class HapticButton: UIButton {
    
    var pressColor: UIColor? {nil}
    var originColor: UIColor? {nil}
    var textPressAlpha: CGFloat {0.4}
    var textColor: UIColor {.white}

    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = textColor
        backgroundColor = originColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = originColor
        tintColor = textColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        backgroundColor = pressColor
        titleLabel?.alpha = textPressAlpha
        imageView?.alpha = textPressAlpha
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if isTouchInside == true {
            UIView.animate(withDuration: 0.5) {
                self.backgroundColor = self.pressColor
                self.titleLabel?.alpha = self.textPressAlpha
                self.imageView?.alpha = self.textPressAlpha
            }
        } else {
            UIView.animate(withDuration: 0.25) {
                self.backgroundColor = self.originColor
                self.titleLabel?.alpha = 1
                self.imageView?.alpha = 1
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isTouchInside == true {
            UIView.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            } completion: { (_) in
                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: []) {
                    self.transform = .identity
                }
            }
        }
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = self.originColor
            self.titleLabel?.alpha = 1
            self.imageView?.alpha = 1
        }
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
//        self.backgroundColor = self.originColor
//        self.titleLabel?.alpha = 1
//        self.imageView?.alpha = 1
//        self.transform = .identity
    }
    
}


