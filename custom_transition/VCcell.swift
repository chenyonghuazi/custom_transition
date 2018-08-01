//
//  VCcell.swift
//  custom_transition
//
//  Created by Edwin on 2018/8/1.
//  Copyright © 2018 Edwin. All rights reserved.
//

import UIKit

class VCcell: UITableViewCell {
    var imageV:UIImageView = {
        let a = UIImageView()
        a.translatesAutoresizingMaskIntoConstraints = false
//        a.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: UIScreen.main.bounds.width, height: 100))
        a.contentMode = .scaleAspectFit
        return a
    }()
    
    let lableV:UILabel = {
        let a = UILabel()
        a.text = "露比超级可爱"
        a.textColor = UIColor.black
        a.translatesAutoresizingMaskIntoConstraints = false
        return a
    }()
    
    let widthHeightRatio = UIScreen.main.bounds.width / 100
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupImageView()
        setupLabelV()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupImageView(){
        contentView.addSubview(imageV)
        imageV.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets.init(top: 5, left: 5, bottom: 0, right: 0), size: CGSize(width: 50 * widthHeightRatio, height: 50))
        imageV.backgroundColor = UIColor.blue
    }
    func setupLabelV(){
        contentView.addSubview(self.lableV)
        lableV.anchor(top: nil, leading: imageV.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0), size: CGSize(width: 100, height: 50))
        lableV.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        lableV.font = UIFont.systemFont(ofSize: 15)
    }

}
