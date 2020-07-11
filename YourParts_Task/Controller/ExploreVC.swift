//
//  ExploreVC.swift
//  YourParts_Task
//
//  Created by Mohamed El-Naggar on 7/9/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import UIKit

class ExploreVC: UIViewController {
    
    @IBOutlet weak var exploreTable: UITableView!
    @IBOutlet weak var loadMoreBtn: UIButton!
    
    var samsungPhones: [Device] = [] , tableDataSource: [Device] = []
    // Paging 0 -- it means load first 10 devices , +1 load the next 10 items
    var pageIndex = 1 , isLoading = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !UserConfig.loadMoreAutomatic {
            loadMoreBtn.isHidden = false
        } else {
            loadMoreBtn.isHidden = true
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromAPI()

    }
    
    func getDataFromAPI() {
        DispatchQueue.global(qos: .background).async {
            APIService.shared.getResponse(url: "https://fonoapi.freshpixl.com/v1/getlatest", success: { (samsungDevices: [Device]?) in
                        
                // Back to main thread
                DispatchQueue.main.async {
                    self.samsungPhones = samsungDevices!
                    // Append only 10 items
                    self.tableDataSource.append(contentsOf: self.samsungPhones[0..<10])
                    self.exploreTable.reloadData()
                }
                
            }) { (err: Error?) in
                // Add Alert -> Extension for ViewController
                self.addAlert(title: "Error", message: err?.localizedDescription)
            }
        }

    }
    
    func loadMore() {
        guard !isLoading else { return }
        guard self.pageIndex * 10 < self.samsungPhones.count else {
            print("Loaded all devices successfully")
            return
        }
        
        // Loading is Not a good indicator because there is no a network delay that takes time get more by pagination or something
        isLoading = true
        var from = self.pageIndex * 10 , to = (self.pageIndex * 10) + 10
        if to >= self.samsungPhones.count { to = self.samsungPhones.count }
        
        self.tableDataSource.append(contentsOf: self.samsungPhones[from ..< to])
        self.exploreTable.reloadData()
        
        self.pageIndex += 1
        isLoading = false
    }
    
    
    @IBAction func loadMoreBtnDidClicked(_ sender: UIButton) {
        loadMore()
    }
}

extension ExploreVC: UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let exploreCell = tableView.dequeueReusableCell(withIdentifier: "ExploreCell") as? ExploreCell else { return UITableViewCell() }
        
        exploreCell.setDeviceName(for: tableDataSource[indexPath.row].deviceName)
        
        return exploreCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Check if user enabled load Automatically by scrolling to the end of table
        // view or not
        guard UserConfig.loadMoreAutomatic else { return }
        
        if indexPath.row == tableDataSource.count - 1 {
            loadMore()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let deviceSpecsVC = self.storyboard?.instantiateViewController(withIdentifier: "DeviceSpecsVC") as? DeviceSpecsVC {
            deviceSpecsVC.device = tableDataSource[indexPath.row]
            self.navigationController?.pushViewController(deviceSpecsVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
