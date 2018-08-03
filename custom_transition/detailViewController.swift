//
//  detailViewController.swift
//  custom_transition
//
//  Created by Edwin on 2018/8/1.
//  Copyright © 2018 Edwin. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    
    var imageV:UIImageView = {
       let a = UIImageView()
        a.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 100)
        a.translatesAutoresizingMaskIntoConstraints = false
        a.contentMode = .scaleAspectFill
        return a
    }()
    
    var roundButton:UIButton = {
       let a = UIButton()
        a.frame = CGRect(x: (UIScreen.main.bounds.width - 50) / 2, y: UIScreen.main.bounds.height - 80, width: 50, height: 50)
        a.layer.cornerRadius = 25
        a.clipsToBounds = true
        a.backgroundColor = UIColor.orange
        a.layer.borderColor = UIColor(white: 1, alpha: 0.6).cgColor
        a.layer.borderWidth = 3
        return a
    }()
    
    var image:UIImage!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.delegate = self
//        view.alpha = 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageV)
        view.addSubview(roundButton)
        setClickRoundButtonAction()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setClickRoundButtonAction(){
        self.roundButton.addTarget(self, action: #selector(handleClicked), for: UIControlEvents.touchUpInside)
    }
    
    @objc func handleClicked(){
        let view = ClickRoundButtonVC()
        self.navigationController?.pushViewController(view, animated: true)
    }


}
extension detailViewController:UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.push && fromVC is detailViewController && toVC is ClickRoundButtonVC{
            let animator = roundButtonTransition()
            animator.circleColor = UIColor.orange
            animator.centerPoint = self.roundButton.center
            print("animator2")
            return animator
        }
//        else if operation == .pop{
//            let animator = roundButtonTransition()
//            animator.circleColor = UIColor.orange
////            animator.centerPoint = self.roundButton.center
//            animator.mode = .pop
//            print("animator2")
//            return animator
//        }
        else{
            return nil
        }
    }
}
