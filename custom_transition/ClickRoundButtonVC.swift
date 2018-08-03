//
//  ClickRoundButtonVC.swift
//  custom_transition
//
//  Created by Edwin on 2018/8/3.
//  Copyright © 2018 Edwin. All rights reserved.
//

import UIKit

class ClickRoundButtonVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.delegate = self
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//extension ClickRoundButtonVC:UINavigationControllerDelegate{
//    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        let toView = toVC as! detailViewController
//        toView.view.alpha = 1
//        return nil
//    }
//}
