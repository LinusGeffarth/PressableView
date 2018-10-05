//
//  PressableView.swift
//  PressableView
//
//  Created by Linus Geffarth on 05.10.18.
//  Copyright © 2018 Linus Geffarh. All rights reserved.
//

import UIKit

@objc public protocol PressableViewDelegate: class {
    @objc optional func pressableViewDidTrigger(_ pressableView: PressableView)
}
@IBDesignable public class PressableView: UIControl, UIGestureRecognizerDelegate {
    
    // MARK: - Outlet Connections
    
    @IBOutlet weak var titleLabel: UILabel?
    
    // MARK: - Objects
    
    var pressableDelegate: PressableViewDelegate?
    var longPress: UILongPressGestureRecognizer!
    
    // MARK: - Variables & Trackers
    
    override public var isEnabled: Bool {
        didSet {
            longPress.isEnabled = isEnabled
        }
    }
    
    /// The scale (in %), the view will be scaled to on press
    @IBInspectable var pressedScale: CGFloat = 0.96
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        longPress = UILongPressGestureRecognizer(target: self, action: #selector(handlePress))
        longPress.delegate = self
        longPress.minimumPressDuration = 0
        longPress.cancelsTouchesInView = true
        
        if let _longPress = self.gestureRecognizers?.first(where: { $0.name == longPress.name }) {
            self.remove(_longPress)
        }
        add(longPress)
        
        // set default value
        isEnabled = true
    }
    
    private var tracker: Timer?
    @objc private func handlePress(longPress: UILongPressGestureRecognizer) {
        switch longPress.state {
        case .began:
            scale(to: pressedScale)
            tracker?.invalidate()
            tracker = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
                self.bounds.contains(longPress.location(in: self)) ? self.sendActions(for: [.touchDragInside, .touchDown]) : self.sendActions(for: .touchDragOutside)
            }
        case .ended:
            scale(to: 1)
            pressableViewDidEndPress()
            tracker?.invalidate()
        case .changed:
            scale(to: 1, delay: 0.1)
            if bounds.contains(longPress.location(in: self)).not {
                longPress.cancel()
                tracker?.invalidate()
                sendActions(for: .touchDragOutside)
            }
        default:
            break
        }
    }
    
    func pressableViewDidEndPress() {
        self.sendActions(for: .primaryActionTriggered)
        self.sendActions(for: .touchUpInside)
        pressableDelegate?.pressableViewDidTrigger?(self)
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool { return true }
}

@IBDesignable public extension PressableView {
    @IBOutlet public var _pressableDelegate: AnyObject? {
        get { return pressableDelegate }
        set { pressableDelegate = newValue as? PressableViewDelegate }
    }
}
