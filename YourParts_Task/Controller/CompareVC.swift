//
//  CompareVC.swift
//  YourParts_Task
//
//  Created by Mohamed El-Naggar on 7/9/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import UIKit

class CompareVC: UIViewController {
    
    @IBOutlet weak var compareTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var devicesList: [(device: Device , isSelectedToCompare: Bool)] = []
    var baseDeviceList: [(device: Device , isSelectedToCompare: Bool)] = []
    var selectedDeviceCount = 0


    lazy var compareBarBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem(title: "Compare", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.CompareDevices))
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        devicesList.removeAll()
        for device in ExploreVC.samsungPhones {
            devicesList.append((device: device , isSelectedToCompare: false))
        }
        baseDeviceList = devicesList
        self.compareTable.reloadData()

    
    }
    
    @objc func CompareDevices() {
        
        guard selectedDeviceCount == 2 else {
            self.addAlert(title: "", message: "Please select 2 devices to compare")
            return
        }
        var selectedDevices: [Device] = []
        
        for dev in baseDeviceList {
            if dev.isSelectedToCompare {
                selectedDevices.append(dev.device)
            }
        }
        
        if let compareDeviceSpec = self.storyboard?.instantiateViewController(withIdentifier: "Compare2DeviceSpecsVC") as? Compare2DeviceSpecsVC {
            
            compareDeviceSpec.devices = selectedDevices
            self.navigationController?.pushViewController(compareDeviceSpec, animated: true)
        }
    }

}


extension CompareVC: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devicesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CompareCell") as? CompareCell else { return UITableViewCell() }
        
        cell.setDeviceName(for: devicesList[indexPath.row].device.deviceName)
        cell.setSelectedBtnBackground(for: (devicesList[indexPath.row].isSelectedToCompare ? .green : .clear))
        
        cell.selectDeviceToCompare = { [unowned self] in
            print( self.selectedDeviceCount)
            
            if self.devicesList[indexPath.row].isSelectedToCompare {
                self.devicesList[indexPath.row].isSelectedToCompare = false
                self.selectedDeviceCount -= 1

                self.navigationItem.rightBarButtonItem = nil
                
                return .clear
            } else if self.selectedDeviceCount < 2 {
                self.selectedDeviceCount += 1
                self.devicesList[indexPath.row].isSelectedToCompare = true
                
                
                for index in 0..<self.baseDeviceList.count {
                    if self.baseDeviceList[index].device.deviceName == self.devicesList[indexPath.row].device.deviceName {
                        self.baseDeviceList[index].isSelectedToCompare = true
                        
                        break
                    }
                }
                
                if self.selectedDeviceCount == 2 {
                    self.navigationItem.rightBarButtonItem = self.compareBarBtn
                }
                
                return .green
            }
            
           
            return .clear
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let deviceSpecsVC = self.storyboard?.instantiateViewController(withIdentifier: "DeviceSpecsVC") as? DeviceSpecsVC {
            deviceSpecsVC.device = devicesList[indexPath.row].device
            self.navigationController?.pushViewController(deviceSpecsVC, animated: true)
        }
    }
}

extension CompareVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
            self.devicesList = baseDeviceList
        } else {
            self.devicesList = self.baseDeviceList.filter({ (filt: (device: Device, isSelectedToCompare: Bool)) -> Bool in
                return filt.device.deviceName?.contains(searchText) ?? false
            })
        }
        
        self.compareTable.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}
