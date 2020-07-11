//
//  Compare2DeviceSpecsVC.swift
//  YourParts_Task
//
//  Created by Mohamed El-Naggar on 7/11/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import UIKit

class Compare2DeviceSpecsVC: UIViewController {

    @IBOutlet weak var specsTable: UITableView!
    var devices: [Device]!
    var specsDataSource: [(attr: String , val1: String? , val2: String?)] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let deviceAtrr = devices[0].getDeviceAtrributes()
        let device2Atrr = devices[1].getDeviceAtrributes()
        for index in 0..<deviceAtrr.count {
            self.specsDataSource.append((deviceAtrr[index].attr , deviceAtrr[index].val , device2Atrr[index].val))
        }
    }
}

extension Compare2DeviceSpecsVC: UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CompareDevicesSpecsCell") as? CompareDevicesSpecsCell else { return UITableViewCell() }
        
        cell.setDeviceSpecs(set: specsDataSource[indexPath.row].attr, to1: specsDataSource[indexPath.row].val1, to2: specsDataSource[indexPath.row].val2)
        
        return cell
    }
    
    // gives it dynamic cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
