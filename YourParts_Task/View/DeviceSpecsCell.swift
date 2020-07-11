//
//  DeviceSpecsCell.swift
//  YourParts_Task
//
//  Created by Mohamed El-Naggar on 7/11/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import UIKit

class DeviceSpecsCell: UITableViewCell {
    
    @IBOutlet weak var attrLabel: UILabel!
    @IBOutlet weak var valLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setDeviceSpecs(set spec: String? , to val: String?) {
        self.attrLabel?.text = spec
        self.valLabel?.text = val
    }
    
}
