//
//  HomeService.swift
//  Plinder
//
//  Created by Patricio Perez on 31/07/2020.
//  Copyright © 2020 Patricio Perez. All rights reserved.
//

import Foundation
import Alamofire

class HomeService {
    fileprivate var baseUrl = ""
    typealias filmsCallBack = (_ films:[HomeFilms]?,_ status:Bool,_ message:String) -> Void
    var callBack:filmsCallBack?
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getMovieHome(apiKey: String){
        AF.request(baseUrl + apiKey, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            guard let data = responseData.data else {
                self.callBack?( nil, true, "")
                return}
            do {
                let films = try JSONDecoder().decode([HomeFilms].self, from: data)
                self.callBack?( films, true, "")
            }catch{
                self.callBack?( nil, false, error.localizedDescription)
            }
        }
    }
    func completionHandler(callBack:@escaping filmsCallBack)  {
        self.callBack = callBack
    }
    
}
