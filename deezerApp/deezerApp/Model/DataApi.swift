//
//  DataApi.swift
//  deezerApp
//
//  Created by Micael Dos Santos on 16/12/2020.
//

import Foundation

struct Data:Codable{
    //var data:DataArtist
    var title:String
    var id:Int
    var name:String
    var picture:String
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    init(json: [String: AnyObject]) throws {
        guard let title = json["title"] as? String else {throw SerializationError.missing("title")}
        guard let id = json["id"] as? Int else {throw SerializationError.missing("id")}
        guard let name = json["name"] as? String else {throw SerializationError.missing("name")}
        guard let picture = json["picture"] as? String else {throw SerializationError.missing("picture")}
        
        self.title = title
        self.id = id
        self.name = name
        self.picture = picture
    }
    
    static func getArtist(name: String, completion: @escaping([Data]) -> ()){
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "https://api.deezer.com/search?q=" + name)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            var dataArray:[Data] = []
            
            if let data = data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
                        //print(json)
                        if let data = json as? [String: AnyObject]{
                            //print(data)
                            if let items = data["data"] as? [[String: AnyObject]]{
                                //print(items)
                                if let artist = items[0]["artist"] as? [String: AnyObject]{
                                    print(artist)
//                                    for case let result in artist.enumerated() {
//                                        if let artistObject = try? Data(json: result){
//                                            print(artistObject)
//                                            dataArray.append(artistObject)
//                                        }
//                                    }
                                    //print(artist)
                                    //for item in artist.values{
                                    //print(item)
                                    //if let artistObject = try? Data(json: item){
                                    //print(artistObject)
                                    
                                    // Array.append(artistObject)
                                    //}
                                    //}
                                }
                            }
                        }
                    }
                }catch {
                    print(error.localizedDescription)
                }
                completion(dataArray)
                
            }
        }
        task.resume()
        
    }
    
    struct DataArtist:Codable{
        var title:String
        var id:Int
        var name:String
        var picture:String
    }
    //
    //struct ArtistDetail:Codable {
    //    var id:Int
    //    var name:String
    //    var picture:String
    //}
    
}
