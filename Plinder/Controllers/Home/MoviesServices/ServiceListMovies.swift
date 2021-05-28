//
//  ServiceListMovies.swift
//  Plinder
//
//  Created by Patricio Perez on 27/05/2021.
//  Copyright © 2021 Patricio Perez. All rights reserved.
//

import Foundation

import Alamofire
import UIKit

class ServiceListMovies {
    fileprivate var baseUrl = ""
    typealias listCallBack = (_ match: ListMovies?,_ status:Bool,_ message:String) -> Void
    var callBack:listCallBack?
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getListHome(type: String){
       AF.request(baseUrl + type).response { response in
            debugPrint(response)
            guard let data = response.data else {
                self.callBack?( nil, true, "")
                return}
            do {
                let movies = try JSONDecoder().decode(ListMovies.self, from: data)
                self.callBack?( movies, true, "")
            }catch{
                self.callBack?( nil, false, error.localizedDescription)
            }
        }
    }
    func completionHandler(callBack:@escaping listCallBack)  {
        self.callBack = callBack
    }
}
