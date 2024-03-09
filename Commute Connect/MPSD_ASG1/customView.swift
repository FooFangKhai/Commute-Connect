//
//  customView.swift
//  MPSD_ASG1
//
//  Created by Marco Setiawan on 02/08/23.
//

import UIKit

class customView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        editView()
    }
    
    func editView(){
    
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 0.3
    }

}
