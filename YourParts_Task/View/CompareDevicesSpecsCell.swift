//
//  CompareDevicesSpecsCell.swift
//  YourParts_Task
//
//  Created by Mohamed El-Naggar on 7/11/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import UIKit

class CompareDevicesSpecsCell: UITableViewCell {

    @IBOutlet weak var attrLabel: UILabel!
    @IBOutlet weak var val1Label: UILabel!
    @IBOutlet weak var val2Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setDeviceSpecs(set spec: String? , to1 val1: String? , to2 val2: String?) {
        self.attrLabel?.text = spec
        self.val1Label?.text = val1
        self.val2Label?.text = val2
    }
    
}
