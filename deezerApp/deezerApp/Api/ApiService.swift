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
            //if let data = data {
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]{
                    //print(json)
                    if let data = json as? [String: AnyObject]{
                        //print(data)
                        if let items = data["data"] as? [[String: AnyObject]]{
                            //print(items)
                            if let artist = items[0]["artist"]! as? [String: AnyObject]{
                                //                                    for case let result in artist.values {
                                //                                        if let artistObject = try? Data(json: result as! [String : AnyObject]){
                                //                                            print(artistObject)
                                //                                            dataArray.append(artistObject)
                                //                                        }
                                //                                    }
                                for (key, result) in artist.enumerated(){
                                    print(artist)
                                    if let artistObject = try? Data(json: artist){
                                        dataArray.append(artistObject)
                                    }
                                }
                                //for item in artist.values{
                                //print(item)
                                //if let artistObject = try? Data(json: item){
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
        /*func getArtist(name: String) {//, completion: @escaping(Result<[ArtistDetail], Error>) -> Void){
         
         let config = URLSessionConfiguration.default
         let session = URLSession(configuration: config)
         let url = URL(string: "https://api.deezer.com/search?q=" + name)!
         
         let task = session.dataTask(with: url) { (data, response, error) in
         if error != nil {
         print(error!.localizedDescription)
         } else {
         if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
         //print(json)
         if let data = json as? [String: AnyObject] {
         //print(data)
         if let items = data["data"] as? [[String: AnyObject]] {
         // print(items)
         if let artist = items[0]["artist"] as? [String: AnyObject]{
         //print(artist)
         //print(artist["name"]!
         //for item in artist {
         //print(item)
         //print(item["name"]!)
         //}
         }
         }
         }
         }
         }
         }
         task.resume()
         }*/
        
        /*func getArtist(name: String, completion: @escaping([Data]) -> ()){
         
         let config = URLSessionConfiguration.default
         let session = URLSession(configuration: config)
         let url = URL(string: "https://api.deezer.com/search?q=" + name)!
         
         let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
         var Array:[Data] = []
         
         if let data = data {
         do{
         if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
         //print(json)
         if let data = json as? [String: AnyObject]{
         //print(data)
         if let items = data["data"] as? [[String: AnyObject]]{
         //print(items)
         if let artist = items[0]["artist"] as? [String: AnyObject]{
         for item in items {
         if let artistObject = try? Data(json: item){
         Array.append(artistObject)
         print(artistObject)
         }
         }
         }
         }
         }
         }
         } catch {
         print(error.localizedDescription)
         }
         completion(Array)
         }
         }
         task.resume()
         }*/
        
        

