//
//  APIService.swift
//  YourParts_Task
//
//  Created by Mohamed El-Naggar on 7/9/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation
import Alamofire

typealias SuccessBlock<T: Decodable> = (T?) -> Void
typealias FailureBlock = (Error?) -> Void
class APIService {
    // 9acb264f67cc593b1c31f6e4ab7a86cb623e12237663a854
    
    func getResponse<T: Decodable>(url: String , success: @escaping SuccessBlock<T> , failed: @escaping FailureBlock) {
        
        let apiToken = "9acb264f67cc593b1c31f6e4ab7a86cb623e12237663a854"
        let parameters = [
            "token": apiToken
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
