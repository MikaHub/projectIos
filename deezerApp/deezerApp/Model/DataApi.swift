//
//  DataApi.swift
//  deezerApp
//
//  Created by Micael Dos Santos on 16/12/2020.
//

import Foundation

struct Data:Decodable{
    var title:String?
    var id:Int?
    var name:String?
    var picture:String?
    
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

    }
}
