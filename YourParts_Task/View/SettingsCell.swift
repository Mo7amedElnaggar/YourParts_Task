//
//  SettingsCell.swift
//  YourParts_Task
//
//  Created by Mohamed El-Naggar on 7/9/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var switchControl: UISwitch!
    
    var switchChanged: ((_ isLoadAutomatic: Bool) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setHeaderLabel(for title: String?) {
        self.headerLabel?.text = title
    }
    
    func setSwitchControl(for isLoad: Bool) {
        self.switchControl?.setOn(isLoad, animated: true)
    }
    
    @IBAction func switchDidChanged(_ sender: UISwitch) {
        switchChanged?(sender.isOn)
    }

}
