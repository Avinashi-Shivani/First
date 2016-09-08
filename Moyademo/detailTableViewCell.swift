//
//  detailTableViewCell.swift
//  Moyademo
//
//  Created by Shivani Pathak on 03/09/16.
//  Copyright © 2016 Shivani Pathak. All rights reserved.
//

import UIKit

class detailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profile_img: UIImageView!
    
    @IBOutlet weak var lbl_name: UILabel!
    
    @IBOutlet weak var lbl_cmpy: UILabel!
    
    @IBOutlet weak var lbl_blog: UILabel!
    
    @IBOutlet weak var lbl_location: UILabel!
    
    @IBOutlet weak var lbl_hireable: UILabel!
    
    @IBOutlet weak var lbl_email: UILabel!
    
    
    @IBOutlet weak var lbl_bio: UILabel!
    
    @IBOutlet weak var lbl_public_repos: UILabel!
    
    @IBOutlet weak var lbl_gists_repos: UILabel!
    
    
    @IBOutlet weak var lbl_followers: UILabel!
    
    @IBOutlet weak var lbl_updated_at: UILabel!
    
    @IBOutlet weak var lbl_created_at: UILabel!
    @IBOutlet weak var lbl_following: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
