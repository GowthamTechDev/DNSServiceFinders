//
//  ScanTableViewCell.swift
//  DNSServiceFinder
//
//  Created by Kiran on 09/10/22.
//

import UIKit

class ScanTableViewCell: UITableViewCell {
    
    @IBOutlet weak var scanLabelFirst: UILabel!
    @IBOutlet weak var scanLabelSecond: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
