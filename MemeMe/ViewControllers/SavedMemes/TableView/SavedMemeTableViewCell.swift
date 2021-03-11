//
//  SavedMemeTableViewCell.swift
//  MemeMe
//
//  Created by Sri Harsha Chilakapati on 12/03/21.
//

import UIKit

class SavedMemeTableViewCell: UITableViewCell {

    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var memeLabel: UILabel!
    
    func bindToMeme(_ meme: Meme) {
        memeImage.image = meme.memedImage
        memeLabel.text = meme.topText + " ... " + meme.bottomText
    }
}
