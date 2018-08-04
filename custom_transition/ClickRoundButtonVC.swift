//
//  ClickRoundButtonVC.swift
//  custom_transition
//
//  Created by Edwin on 2018/8/3.
//  Copyright © 2018 Edwin. All rights reserved.
//

import UIKit

class ClickRoundButtonVC: UIViewController {
    
    var imageV:UIImageView = {
       let a = UIImageView()
        a.contentMode = .scaleAspectFit
        a.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        a.image = UIImage(named: "tinco")
        a.clipsToBounds = true
        a.layer.cornerRadius = 50
        a.backgroundColor = UIColor.orange
        return a
    }()
    
    let Pulsinglayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.delegate = self
        self.view.backgroundColor = UIColor.white
        setupPulsing()
        setupImageV()
        addPulsingAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupImageV(){
        view.addSubview(imageV)
        imageV.center = self.view.center
    }
    
    func setupPulsing(){
        
        let path = UIBezierPath(arcCenter: .zero, radius: 50, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        Pulsinglayer.fillColor = UIColor.init(red: 249/255, green: 150/255, blue: 57/255, alpha: 1).cgColor
//        Pulsinglayer.strokeColor = UIColor.orange.cgColor
        Pulsinglayer.path = path.cgPath
        print("center",view.center.x)
//        Pulsinglayer.position = CGPoint(x: (UIScreen.main.bounds.width - 50) / 2, y: (UIScreen.main.bounds.height - 50) / 2)
        Pulsinglayer.position = view.center
//        Pulsinglayer.lineWidth = 20
        view.layer.addSublayer(Pulsinglayer)
    }
    func addPulsingAnimation(){
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1.5
        animation.duration = 0.8
        animation.autoreverses = true
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.repeatCount = Float.infinity
        Pulsinglayer.add(animation, forKey: "pulsing")
    }
}




//extension ClickRoundButtonVC:UINavigationControllerDelegate{
//    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        let toView = toVC as! detailViewController
//        toView.view.alpha = 1
//        return nil
//    }
//}
