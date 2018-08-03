//
//  roundButtonTransition.swift
//  custom_transition
//
//  Created by Edwin on 2018/8/2.
//  Copyright © 2018 Edwin. All rights reserved.
//

import Foundation
import UIKit

class roundButtonTransition:NSObject,UIViewControllerAnimatedTransitioning{
    
    let duration = 0.3
    
    var circle:UIView!
    
    var centerPoint:CGPoint?
    
    var circleColor:UIColor!
    
    var mode:transitionMode = .present
    
    enum transitionMode:Int {
        case present, dismiss, pop
    }
    
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) as? ClickRoundButtonVC,
        let fromeVC = transitionContext.viewController(forKey: .from) as? detailViewController
            else {return}
        
        let container = transitionContext.containerView
        let toVCCenterPoint = toVC.view.center
        
        if mode == .present{
        
            circle = UIView()
            
            circle.frame = frameForCircle(withViewCenter: toVC.view.center, size: toVC.view.frame.size, startPoint: centerPoint!)
            circle.layer.cornerRadius = circle.frame.size.height / 2
            print("frame:",circle.frame)
            circle.center = centerPoint!
            circle.backgroundColor = circleColor
            circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            toVC.view.alpha = 0
            toVC.view.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            toVC.view.center = centerPoint!
            container.addSubview(circle)
            container.addSubview(toVC.view)
        
        
            
            UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
                self.circle.transform = CGAffineTransform.identity
                toVC.view.transform = CGAffineTransform.identity
                fromeVC.view.alpha = 0
                self.circle.alpha = 0
                toVC.view.center = toVCCenterPoint
            }) {(finish:Bool) in
                
                
            }
            
            UIView.animate(withDuration: 0.3, delay: duration, animations: {
                
                toVC.view.alpha = 1
                
            }) { (finish:Bool) in
                fromeVC.view.alpha = 1
                    transitionContext.completeTransition(finish)
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
            
        }
//        else if mode == .pop{
//            guard let returningView = transitionContext.view(forKey: .from) else{return}
//            let returningCenter = returningView.center
//            let returningSize = returningView.frame.size
//
//            circle.frame = frameForCircle(withViewCenter: returningCenter, size: returningSize, startPoint: centerPoint!)
//            circle.layer.cornerRadius = circle.frame.size.height / 2
//            circle.center = centerPoint!
//
//            UIView.animate(withDuration: duration, animations: {
//                self.circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
//                returningView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
//                returningView.center = self.centerPoint!
//                returningView.alpha = 0
//
//                if self.mode == .pop {
//                    container.insertSubview(returningView, belowSubview: returningView)
//                    container.insertSubview(self.circle, belowSubview: returningView)
//                }
//
//
//            }, completion: { (success:Bool) in
//                returningView.center = self.centerPoint!
//                returningView.removeFromSuperview()
//
//                self.circle.removeFromSuperview()
//
//                transitionContext.completeTransition(success)
//
//            })
//        }
        
    }
    
    
}

extension roundButtonTransition{
    func frameForCircle (withViewCenter viewCenter:CGPoint, size viewSize:CGSize, startPoint:CGPoint) -> CGRect {
        let xLength = fmax(startPoint.x, viewSize.width - startPoint.x)
        let yLength = fmax(startPoint.y, viewSize.height - startPoint.y)
        
        let offestVector = sqrt(xLength * xLength + yLength * yLength) * 2
        let size = CGSize(width: offestVector, height: offestVector)
        
        return CGRect(origin: CGPoint.zero, size: size)
        
    }
}
