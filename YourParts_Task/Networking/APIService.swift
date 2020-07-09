//
//  APIService.swift
//  YourParts_Task
//
//  Created by Mohamed El-Naggar on 7/9/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation
import Alamofire
import Keys

typealias SuccessBlock<T: Decodable> = (T?) -> Void
typealias FailureBlock = (Error?) -> Void

private let podKeys = YourParts_TaskKeys()

class APIService {
    static let shared = APIService()

    func getResponse<T: Decodable>(url: String , success: @escaping SuccessBlock<T> , failed: @escaping FailureBlock) {
        
        let apiToken = podKeys.fono_API_Token
        let parameters = [
            "token": apiToken,
            "brand": "Samsung"
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: nil)
            .responseJSON { (response) in
                guard let data = response.data else {
                    failed(APIError.convertResponseData)
                    return
                }
                
                switch response.result {
                case .failure(let err):
                    failed(err)
                case .success( _):
                    do {
                        let respnseVal = try JSONDecoder().decode(T.self, from: data)
                        success(respnseVal)
                    } catch(let err) {
                        failed(err)
                    }
                }
        }
    }
    
    
}
