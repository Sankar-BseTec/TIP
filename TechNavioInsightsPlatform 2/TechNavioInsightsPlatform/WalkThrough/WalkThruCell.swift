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
        
        let titleParagraphStyle = NSMutableParagraphStyle()
        titleParagraphStyle.alignment = .center
        
        let titleAttributes = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: UIFont.systemFont(ofSize: 22),NSParagraphStyleAttributeName: titleParagraphStyle]
        let descOtherAttributes = [NSForegroundColorAttributeName: UIColor.gray, NSFontAttributeName: UIFont.systemFont(ofSize: 15),NSParagraphStyleAttributeName: titleParagraphStyle]
        
        let strWithNewLine = dataToDisplay.titleText + "\n\n"
        
        let textPart = NSMutableAttributedString(attributedString: NSMutableAttributedString(string: strWithNewLine, attributes: titleAttributes))
        
        let partTwo = NSMutableAttributedString(string: dataToDisplay.descText, attributes: descOtherAttributes)
        textPart.append(partTwo)
        
      
        
        txtVwWalkThru.attributedText = textPart
        
    }
    
}
