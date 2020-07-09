//
//  UserConfig.swift
//  YourParts_Task
//
//  Created by Mohamed El-Naggar on 7/9/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation

class UserConfig {
    
    static var loadMoreAutomatic: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: "loadMoreAutomatic")
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "loadMoreAutomatic")
        }
    }
    
}
