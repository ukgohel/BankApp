//
//  filtercell.swift
//  demoBank
//
//  Created by Abcom on 08/08/24.
//

import UIKit

class filtercell: UITableViewCell {
    
    @IBOutlet weak var lblTextData : UILabel!
    @IBOutlet weak var imgblank : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
