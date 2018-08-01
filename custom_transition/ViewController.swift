//
//  ViewController.swift
//  custom_transition
//
//  Created by Edwin on 2018/7/31.
//  Copyright © 2018 Edwin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableV = UITableView()
    
    var selectedCell:VCcell!
    
    let widthHeightRatio = UIScreen.main.bounds.width / 100
    
    let imageSet = ["0","1","2","3","4","5","6"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        setupTableView()
        setupNavigation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNavigation(){
        if let nav = self.navigationController?.navigationBar{
            nav.shadowImage = UIImage()
            nav.isTranslucent = true
            nav.setBackgroundImage(UIImage(), for: .default)
            nav.backgroundColor = UIColor.clear
            nav.tintColor = UIColor.black
        }
    }


}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func setupTableView(){
        view.addSubview(tableV)
        tableV.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *){
            tableV.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        }else{
            tableV.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        }
        tableV.delegate = self
        tableV.dataSource = self
        tableV.register(VCcell.self, forCellReuseIdentifier: "cell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! VCcell
        cell.imageV.image = UIImage(named: imageSet[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let view = detailViewController()
        self.selectedCell = tableView.cellForRow(at: indexPath) as! VCcell
        view.image = self.selectedCell.imageV.image
        self.navigationController?.pushViewController(view, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension ViewController:UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.push {
            return animation()
        } else {
            return nil
        }
    }
}



















