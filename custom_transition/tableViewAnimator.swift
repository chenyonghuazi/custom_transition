//
//  tableViewAnimator.swift
//  custom_transition
//
//  Created by Edwin on 2018/8/4.
//  Copyright © 2018 Edwin. All rights reserved.
//

import Foundation
import UIKit


class tableVoewAnimator: NSObject,UIViewControllerAnimatedTransitioning {
    
    let duration = 0.5
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) as? ViewController else{return}
        
        let container = transitionContext.containerView
        
        let cells = toVC.tableV.visibleCells
        for cell in cells{
            cell.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
        }
        
        toVC.view.layoutIfNeeded()
        container.addSubview(toVC.view)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            for cell in cells{
                cell.transform = .identity
            }
        }) { (finish:Bool) in
            transitionContext.completeTransition(finish)
        }
       
    }
    
    
}
