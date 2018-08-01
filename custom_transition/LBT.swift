//
//  LBT.swift
//  custom_transition
//
//  Created by Edwin on 2018/8/1.
//  Copyright © 2018 Edwin. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    func dropShadow(scale: Bool = true) {
        layer.cornerRadius = frame.width / 30
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: -1, height: 1)
        //        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 10
        
        //        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        //        layer.shouldRasterize = true
        //        layer.rasterizationScale = scale ? UIScreen.main.scale : 0.5
    }
    
    func fillSuperview() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    //-----
    func roundBound(){
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
    //------
    
    func addCustomMenuShadow(){
        self.layer.shadowOffset = CGSize(width: 5, height: self.frame.height)
        self.layer.shadowOpacity = 0.1
    }
    //------
}
