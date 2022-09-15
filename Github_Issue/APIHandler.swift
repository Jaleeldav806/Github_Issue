//
//  APIHandler.swift
//  Github_Issue
//
//  Created by Jaleel Davidson on 9/9/22.
//

import Foundation

class APIHandler {

    var callback: (([Issues]?, Error?) -> ())? 
    
    func getData(str: String) {
        
        guard let url = URL.init(string: str) else { return }
        
        URLSession.shared.dataTask(with: url) { data, urlresponse, error in
            
            let jsonDecoder = JSONDecoder.init()
            if error == nil {
                do {
                    let arr = try jsonDecoder.decode([Issues].self, from: data!)
                    self.callback?(arr, nil)

                } catch (let decodingError) {
                    self.callback?(nil, decodingError)
                }
            } else {
                self.callback?(nil, error)
            }
        }.resume()
    }
}
