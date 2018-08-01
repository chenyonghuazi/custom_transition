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
    
    var image:UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageV)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
