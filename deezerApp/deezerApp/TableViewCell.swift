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
    
    @IBOutlet weak var artistFirstName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
