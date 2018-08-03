//
//  animation.swift
//  custom_transition
//
//  Created by Edwin on 2018/7/31.
//  Copyright © 2018 Edwin. All rights reserved.
//

import Foundation
import UIKit

class animation:NSObject,UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? ViewController,
            let toVC = transitionContext.viewController(forKey: .to) as? detailViewController,
            let snapshot = fromVC.selectedCell.imageV.snapshotView(afterScreenUpdates: false)
            else {return}
        let container = transitionContext.containerView
        snapshot.frame = container.convert(fromVC.selectedCell.imageV.frame, from: fromVC.selectedCell)
        fromVC.selectedCell.imageV.isHidden = true
        
        toVC.view.frame = transitionContext.finalFrame(for: toVC)
        toVC.view.alpha = 0
        
        container.addSubview(toVC.view)
        container.addSubview(snapshot)
        
        toVC.imageV.layoutIfNeeded()
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            snapshot.frame = toVC.imageV.frame
            toVC.view.alpha = 1
        }) { (finish:Bool) in
            fromVC.selectedCell.imageV.isHidden = false
            toVC.imageV.image = toVC.image
            snapshot.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            transitionContext.completeTransition(finish)
        }
    }
    
    
}
