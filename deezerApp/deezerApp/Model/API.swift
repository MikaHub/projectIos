//
//  API.swift
//  deezerApp
//
//  Created by Micael Dos Santos on 17/12/2020.
//

import Foundation

class API: URLSession  {
    
    func getRequest(matching query: String, type: Artists, completion: @escaping ([Any], Int) -> Void) {
        let request = NSMutableURLRequest(url: URL(string: query)!)
        let session = URLSession.shared
        request.httpMethod = "GET"
        session.dataTask(with: request as URLRequest, completionHandler: { data,_,_ in
            var requestArray = [Any]()
            var total = 0
            if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let array = json["data"] as? NSArray {
                total = (json["total"] as? Int)!
                for case let result in array {
                    if let object = Artists.parse(result as! [String : Any]) {
                        requestArray.append(object)
                    }
                }
            }
            completion(requestArray, total)
        }).resume()
    }
        
   /* private func structTypeToAppend(requestArray: inout [Any], type: Artists, result: Any) {
        switch type {
        case .Artist:
            if let object = Artists.parse(result as! [String : Any]) {
                requestArray.append(object)
            }
        case .Albums:
            if let object = Albums.parse(result as! [String : Any]) {
                requestArray.append(object)
            }
        case .Tracks:
            if let object = Tracks.parse(result as! [String : Any]) {
                requestArray.append(object)
            }
        }
    }*/
}
