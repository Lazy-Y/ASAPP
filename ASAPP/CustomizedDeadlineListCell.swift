//
//  CustomizedDeadlineListCell.swift
//  ASAPP
//
//  Created by Elliscope Mingzhe Fang on 11/26/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import UIKit

class CustomizedDeadlineListCell: UITableViewCell {

    @IBOutlet weak var SchoolImage: UIImageView!
    @IBOutlet weak var SchoolName: UILabel!
    
    @IBOutlet var type: UILabel!
    
    @IBOutlet var rate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
