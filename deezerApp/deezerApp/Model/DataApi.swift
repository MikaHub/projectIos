//
//  DataApi.swift
//  deezerApp
//
//  Created by Micael Dos Santos on 16/12/2020.
//

import Foundation

struct Data:Decodable{
    //var data:DataArtist
    var title:String?
    var id:Int?
    var name:String?
    var picture:String?
    
//    enum SerializationError:Error {
//        case missing(String)
//        case invalid(String, Any)
//    }
    
    init(json: [String: AnyObject])  {
        if let title = json["title"] as? String {
            self.title = title
        }
        if let id = json["id"] as? Int {
            self.id = id
        }
        if let name = json["name"] as? String {
            self.name = name
        }
        if let picture = json["picture"] as? String {
            self.picture = picture
        }
        
//        guard let title = json["title"] as? String else {throw SerializationError.missing("title")}
//        guard let id = json["id"] as? Int else {throw SerializationError.missing("id")}
//        guard let name = json["name"] as? String else {throw SerializationError.missing("name")}
//        guard let picture = json["picture"] as? String else {throw SerializationError.missing("picture")}
//
//        self.title = title
//        self.id = id
//        self.name = name
//        self.picture = picture
    }
    
    
//    struct DataArtist:Codable{
//        var title:String
//        var id:Int
//        var name:String
//        var picture:String
//    }
    //
    //struct ArtistDetail:Codable {
    //    var id:Int
    //    var name:String
    //    var picture:String
    //}
    
}
