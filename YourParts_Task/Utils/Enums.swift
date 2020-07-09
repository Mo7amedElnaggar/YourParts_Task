//
//  Enums.swift
//  YourParts_Task
//
//  Created by Mohamed El-Naggar on 7/9/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation


public enum APIError: Error {
    case convertResponseData
    
    var localizedDescription: String {
        switch self {
        case .convertResponseData:
            return "Can not convert response data to handle codable object"
        }
    }
}
