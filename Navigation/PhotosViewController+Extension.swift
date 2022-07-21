//
//  UIViewController+Extension.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 18.07.2022.
//

import Foundation
import UIKit

extension PhotosViewController {

    func makeCollectionView(scrollDirection: UICollectionView.ScrollDirection) -> UICollectionView {
                let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = scrollDirection

                let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
                collectionView.translatesAutoresizingMaskIntoConstraints =  false
                collectionView.backgroundColor = .systemGray2
                // создаем ячейку и здесь ее регистрируем
                collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
                return collectionView
    }

}
