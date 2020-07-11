//
//  DeviceSpecsVC.swift
//  YourParts_Task
//
//  Created by Mohamed El-Naggar on 7/11/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import UIKit

class DeviceSpecsVC: UIViewController {

    @IBOutlet weak var specsTable: UITableView!
    
    var device: Device! , specsDataSource: [(attr: String , val: String?)]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        specsDataSource = device.getDeviceAtrributes()

    }
}


extension DeviceSpecsVC: UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceSpecsCell") as? DeviceSpecsCell else { return UITableViewCell() }
        
        cell.setDeviceSpecs(set: specsDataSource![indexPath.row].attr, to: specsDataSource![indexPath.row].val)
        
        return cell
    }
    
    // gives it dynamic cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
