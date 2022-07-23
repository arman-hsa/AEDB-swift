//
//  AETableViewCell.swift
//  AESwiftDatabase
//
//  Created by arman on 12/8/15.
//  Copyright © 2015 arman. All rights reserved.
//

import UIKit
import SDWebImage

class AETableViewCell: UITableViewCell {
    @IBOutlet weak var mechNameLabel: UILabel!
    
    @IBOutlet weak var mechDescriptionLabel: UILabel!
    @IBOutlet weak var mechVignetteImageView: UIImageView!
    
    var mech:AEMechInformation?{
        didSet{
            updateCell()
        }
    }
    
    let block: SDWebImageCompletionBlock! = {(image: UIImage!, error: NSError!, cacheType: SDImageCacheType!, imageURL: NSURL!) -> Void in
        print(self)
    }
    
    func updateCell(){
        if let currentMech = mech{
            mechNameLabel.text = currentMech.mechName
            mechDescriptionLabel.text = currentMech.abstract
            mechVignetteImageView.sd_setImageWithURL(NSURL(string: currentMech.mechURL), completed: block);
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        updateCell()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
