//
//  UIBootton.swift
//  temp
//
//  Created by Erick Sanchez on 5/6/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

extension UIView {
    func transformToSquare() {
        let viewCenter = self.center
        let edgeLength = max(self.frame.width, self.frame.height)
        self.frame = CGRect(x: 0, y: 0, width: edgeLength, height: edgeLength)
        self.center = viewCenter
    }
}

@IBDesignable
open class UIBootton: UIButton {
    
    @IBOutlet weak var badge: UILabel?
    
    @IBInspectable
    var styledBadge: Bool = false
    
    @IBInspectable
    var value: Int = 0
    
    open static var cornerRadius: CGFloat = 4.0
    
    open static var outlineWidth: CGFloat = 1.0
    
    open static var outlineColor: UIColor = .blue
    
    @IBInspectable
    open var roundedOutline: Bool = false {
        didSet {
            if roundedOutline == true {
                outlined = true
                cornerRadius = UIBootton.cornerRadius
                outlineColor = UIBootton.outlineColor
                margin = CGSize(width: 12.0, height: 8.0)
            } else {
                outlined = false
                cornerRadius = 0.0
                outlineColor = nil
                margin = CGSize.zero
            }
        }
    }
    
    @IBInspectable
    open var corners: CGFloat = 0.0 {
        didSet {
            cornerRadius = corners
        }
    }
    
    open var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable
    open var margin: CGSize = .zero {
        didSet {
            setMargin(
                top: margin.height,
                left: margin.width,
                bottom: margin.height,
                right: margin.width
            )
        }
    }
    
    open func setMargin(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        contentEdgeInsets = UIEdgeInsets(
            top: top,
            left: left,
            bottom: bottom,
            right: right
        )
    }
    
    @IBInspectable
    open var outlined: Bool = false {
        didSet {
            if outlined == true {
                if self.outlineWidth == 0.0 {
                    outlineWidth = UIBootton.outlineWidth
                }
            } else {
                outlineWidth = 0.0
            }
        }
    }
    
    @IBInspectable
    open var outlineWidth: CGFloat = 0.0 {
        didSet {
            borderWidth = outlineWidth
        }
    }
    
    open var borderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable
    open var outlineColor: UIColor? = UIBootton.outlineColor {
        didSet {
            self.layer.borderColor = outlineColor?.cgColor
        }
    }
    
    @IBInspectable
    open var shadowColor: UIColor? = .clear {
        didSet {
            self.layer.shadowColor = shadowColor?.cgColor
        }
    }
    
    @IBInspectable
    open var shadowRadius: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable
    open var shadowOffset: CGSize = .zero {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable
    open var shadowOpacity: Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        if let badge = self.badge, self.styledBadge {
            UIDesignable.applyCircle(to: badge)
                .bgColor(.red)
        }
        
        if let badge = self.badge {
            badge.text = String(value)
        }
    }
}
