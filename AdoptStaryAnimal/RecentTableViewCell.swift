//
//  RecentTableViewCell.swift
//  AdoptStaryAnimal
//
//  Created by kevin on 2018/5/26.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import UIKit

class RecentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var bodyTypeLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var shelterLabel: UILabel!
    @IBOutlet weak var reedMoreBtn: UIButton!
    
    var animal: Animal?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
