//
//  Service.swift
//  Plinder
//
//  Created by Patricio Perez on 31/07/2020.
//  Copyright © 2020 Patricio Perez. All rights reserved.
//

import Foundation
import Alamofire

// Hacer un nuevo servicio para que me traiga todas las peliculas

class Service {
    fileprivate var baseUrl = ""
    
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getMovie(apiKey: String){
        AF.request(baseUrl + apiKey, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            guard let data = responseData.data else {return}
            do {
                let films = try JSONDecoder().decode(Film.self, from: data)
                print("films == \(films)")
            }catch{
                print("Error decond ==\(error.localizedDescription)")
            }
        }
    }
}



