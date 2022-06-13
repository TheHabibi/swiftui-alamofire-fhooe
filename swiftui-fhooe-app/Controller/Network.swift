//
//  Network.swift
//  swiftui-fhooe-app
//
//  Created by Ali Eren Çelebi on 11.06.2022.
//

import Foundation
import Alamofire

class Network {
    
    func getBachelors(completion: @escaping(Swift.Result<ApiResponse, Error>)->Void){

        Alamofire.request("https://fhooe-api.herokuapp.com/bachelors").responseData { response in

        let json = response.data
           
        do{
            let bachelors = try JSONDecoder().decode(ApiResponse.self, from: json!)
            completion(.success(bachelors))
        }
            catch let jsonError{
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }
    }
}




