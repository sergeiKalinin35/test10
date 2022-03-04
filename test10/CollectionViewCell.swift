//
//  CollectionViewCell.swift
//  test10
//
//  Created by Sergey on 03.03.2022.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var nameCast: UILabel!
    
    @IBOutlet var image: UIImageView!
    
    
    override func prepareForReuse() { // переиспользование и обнуления ячейки
        image.image = nil
    }
    
    func configure(with char: Cast) {
        
        nameCast.text = char.name
    
        
        image.kf.indicatorType = .activity
        image.kf.setImage(
            with: URL(string: "https://image.tmdb.org/t/p/original/\(char.profile_path ?? "")"),
            placeholder: nil,
            options: [.transition(.fade(0.2))],
            progressBlock: nil
        )
    }
}
