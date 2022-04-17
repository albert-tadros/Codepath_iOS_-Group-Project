//
//  NoteCellTableViewCell.swift
//  Eftekad
//
//  Created by ALBERT TADROS on 3/23/22.
//

import UIKit

class NoteCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var noteTitleLabel: UILabel!
    @IBOutlet weak var noteContentLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
