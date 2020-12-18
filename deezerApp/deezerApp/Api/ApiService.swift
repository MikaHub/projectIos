//
//  ApiService.swift
//  deezerApp
//
//  Created by Micael Dos Santos on 16/12/2020.
//

import Foundation

class ApiService {
    
    static func getArtist(name: String, completion: @escaping([Data]) -> ()){
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "https://api.deezer.com/search?q=" + name)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            var dataArray:[Data] = []
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]{
                    //print(json)
                    if let data = json as? [String: AnyObject]{
                        //print(data)
                        if let items = data["data"] as? [[String: AnyObject]]{
                            //print(items)
                            if let artist = items[0]["artist"]! as? [String: AnyObject]{
                                for (key, result) in artist.enumerated(){
                                    //print(artist)
                                    if let artistObject = try? Data(json: artist){
                                        dataArray.append(artistObject)
                                    }
                                }
                            }
                        }
                    }
                }
                }catch {
                    print(error.localizedDescription)
                }
                completion(dataArray)
                //}
            }
            task.resume()
    }
}
