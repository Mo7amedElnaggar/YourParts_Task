//
//  SettingsVC.swift
//  YourParts_Task
//
//  Created by Mohamed El-Naggar on 7/9/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var settingsTable: UITableView!
    
    var datasource: [(title: String , isLoadAuto: Bool)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datasource.append(("Load more automatically" , UserConfig.loadMoreAutomatic))
        
    }
    
}

extension SettingsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let settingCell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell") as? SettingsCell else { return UITableViewCell() }
         
        settingCell.setHeaderLabel(for: datasource[indexPath.row].title)
        settingCell.setSwitchControl(for: datasource[indexPath.row].isLoadAuto)
        
        // Call back if switch is changed
        settingCell.switchChanged = { (isLoadAuto: Bool) in
            UserConfig.loadMoreAutomatic = isLoadAuto
        }

        return settingCell
    }
}
