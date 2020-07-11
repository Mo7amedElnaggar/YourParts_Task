//
//  CompareCell.swift
//  YourParts_Task
//
//  Created by Mohamed El-Naggar on 7/10/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import UIKit

class CompareCell: UITableViewCell {

    @IBOutlet weak var deviceLabel: UILabel!
    @IBOutlet weak var selectDeviceBtn: UIButton!
    
    var selectDeviceToCompare: (() -> UIColor)?
    
    override func prepareForReuse() {
        selectDeviceBtn.backgroundColor = .clear
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initComm()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func initComm() {
        self.selectDeviceBtn?.layer.cornerRadius = 15.0
        self.selectDeviceBtn?.layer.borderColor = UIColor.green.cgColor
        self.selectDeviceBtn?.layer.borderWidth = 1.0
    }
    
    func setDeviceName(for name: String?) {
        self.deviceLabel?.text = name
    }
    
    func setSelectedBtnBackground(for color: UIColor?) {
        self.selectDeviceBtn?.backgroundColor = color
    }
    
    @IBAction func setSelectDeviceViewBg(_ sender: UIButton) {
        let color = selectDeviceToCompare?()
        self.selectDeviceBtn?.backgroundColor = color
    }

}
