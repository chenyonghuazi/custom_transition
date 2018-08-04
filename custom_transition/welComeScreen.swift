//
//  welComeScreen.swift
//  custom_transition
//
//  Created by Edwin on 2018/8/4.
//  Copyright © 2018 Edwin. All rights reserved.
//

import UIKit

class welComeScreen: UIViewController {
    
    var timer = Timer()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTimer()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: false)
    }
    @objc func handleTimer(){
        let View = ViewController()
        self.navigationController?.pushViewController(View, animated: true)
    }

}
extension welComeScreen:UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.push && fromVC is welComeScreen && toVC is ViewController{
            print("animation2")
            return tableVoewAnimator()
        } else {
            return nil
        }
    }
}
