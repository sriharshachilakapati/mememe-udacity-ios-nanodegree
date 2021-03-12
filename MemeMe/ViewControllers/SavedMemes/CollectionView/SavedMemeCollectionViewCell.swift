//
//  SavedMemeCollectionViewCell.swift
//  MemeMe
//
//  Created by Sri Harsha Chilakapati on 12/03/21.
//

import UIKit

class SavedMemeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var memeImageView: UIImageView!
    
    func bindToMeme(_ meme: Meme) {
        memeImageView.image = meme.memedImage
    }
}
