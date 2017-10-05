//
//  PopupCell.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 26/09/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import UIKit

class PopupCell: UITableViewCell {

    @IBOutlet weak var tickHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var tickWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var txtLbl: UILabel!
    @IBOutlet weak var selectionImgVw: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
