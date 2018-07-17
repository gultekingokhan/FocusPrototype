//
//  UIView+Extension.swift
//  FocusPrototype
//
//  Created by Gokhan Gultekin on 2.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

extension UIView {
    
    override open func awakeFromNib() {
        
    }
    
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 0);
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 6
    }
    
    func radius(radius: CGFloat) {
        layer.cornerRadius = radius
    }
}
