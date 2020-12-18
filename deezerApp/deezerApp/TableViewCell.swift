//
//  TableViewCell.swift
//  deezerApp
//
//  Created by Micael Dos Santos on 16/12/2020.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageArtist: UIImageView!
    
    @IBOutlet weak var artistName: UILabel!
        
    func setCellWithValuesOf(_ data:Data){
        updateUI(name: data.name, picture: data.picture, id: data.id)
    }
    
    private func updateUI(name: String?, picture: String?, id: Int?){
        self.artistName.text = name
        //self.artistFirstName.text = picture
        //self.imageArtist.image = picture
    }
}
