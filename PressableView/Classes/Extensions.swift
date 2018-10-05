//
//  Extensions.swift
//  PressableView
//
//  Created by Linus Geffarth on 05.10.18.
//  Copyright © 2018 Linus Geffarh. All rights reserved.
//

import UIKit

extension UIView {
    /**
     Scales view to passed percentage equally for width and height of original size
     
     - parameter x: Percentage to which the width should be scaled
     - parameter y: Percentage to which the height should be scaled
     - parameter animated: Determines whether the sclaing should be animated, `true` by default
     - parameter duration: Duration of the animation, default value: `0.3`
     - parameter delay: Delay of the animation, default value: `0`
     - parameter completion: Closure called on completion of the animation
     */
    func scale(to size: CGFloat, animated: Bool = true, duration: TimeInterval = 0.3, delay: TimeInterval = 0, completion: (() -> Void)? = nil) {
        scale(x: size, y: size, animated: animated, duration: duration, delay: delay, completion: completion)
    }
    /**
     Scales view to passed width and height percentage of original size
     
     - parameter x: Percentage to which the width should be scaled
     - parameter y: Percentage to which the height should be scaled
     - parameter animated: Determines whether the sclaing should be animated, `true` by default
     - parameter duration: Duration of the animation, default value: `0.3`
     - parameter delay: Delay of the animation, default value: `0`
     - parameter completion: Closure called on completion of the animation
     */
    func scale(x: CGFloat, y: CGFloat, animated: Bool = true, duration: TimeInterval = 0.3, delay: TimeInterval = 0, completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: animated ? duration : 0, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform(scaleX: x, y: y)
        }) { _ in
            completion?()
        }
    }
    
    func add(_ gestureRecognizers: UIGestureRecognizer...) {
        gestureRecognizers.forEach {
            self.addGestureRecognizer($0)
        }
    }
    
    func remove(_ gestureRecognizers: UIGestureRecognizer...) {
        gestureRecognizers.forEach {
            self.removeGestureRecognizer($0)
        }
    }
}

extension Bool {
    /// Returns opposite value of self in form of an easy-to-read variable
    var not: Bool {
        return !self
    }
}

extension UIGestureRecognizer {
    func cancel() {
        isEnabled = false
        isEnabled = true
    }
}
