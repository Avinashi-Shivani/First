//
//  TableViewCell.swift
//  Moyademo
//
//  Created by Shivani Pathak on 02/09/16.
//  Copyright © 2016 Shivani Pathak. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_stationname: UILabel!
    
    @IBOutlet weak var lbl_buildyear: UILabel!
    
    @IBOutlet weak var profile_pic: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
