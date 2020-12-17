//
//  ArtistModel.swift
//  deezerApp
//
//  Created by Micael Dos Santos on 17/12/2020.
//

import Foundation

struct Artist {
    
    let id: Int
    let name: String
    let pictureString: String?

    // parse json
    static func parse(_ json: [String: Any]) -> Artist? {
        let id = json["id"] as? Int
        let name = json["name"] as? String
        let pictureString = json["picture_big"] as? String ?? ""
        return Artists(id: id!, name: name!, pictureString: pictureString)
    }
    
}
