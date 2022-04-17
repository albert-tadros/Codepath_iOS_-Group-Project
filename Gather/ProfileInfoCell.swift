//
//  ProfileInfoCell.swift
//  Gather
//
//  Created by ALBERT TADROS on 4/16/22.
//

import UIKit

class ProfileInfoCell: UITableViewCell {
    
    
    @IBOutlet weak var professionalTitleTagLabel: UILabel!
    @IBOutlet weak var userProfessionalTitleLabel: UILabel!
    @IBOutlet weak var emailTagLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var phoneNumTagLabel: UILabel!
    @IBOutlet weak var userPhoneNumLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
