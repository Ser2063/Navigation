//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 04.07.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
