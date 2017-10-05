//
//  WalkThruCell.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 03/10/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import UIKit

class WalkThruCell: UICollectionViewCell {

    @IBOutlet weak var txtVwWalkThru: UITextView!
    var dataToPlace : WalkThroughModel?
    
    
    @IBOutlet weak var imgVw: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func applyValues(dataToDisplay : WalkThroughModel) -> Void {
        
        imgVw.image = UIImage(named: dataToDisplay.imageName)
        
        let titleAttributes = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: UIFont.systemFont(ofSize: 22)]
        let descOtherAttributes = [NSForegroundColorAttributeName: UIColor.gray, NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        
        let textPart = NSMutableAttributedString(attributedString: NSMutableAttributedString(string: dataToDisplay.titleText, attributes: titleAttributes))
        
        let partTwo = NSMutableAttributedString(string: dataToDisplay.descText, attributes: descOtherAttributes)
        textPart.append(partTwo)
        
        txtVwWalkThru.attributedText = textPart
        
    }
    
}
