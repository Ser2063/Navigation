//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 04.07.2022.
//

import UIKit

class PhotosViewController: UIViewController {


// не создаем модель для collectionView а просто делаем массив
    private var collectionViewArray: [Int] {
        var collectionViewArray = [Int]()
        for element in 0...20 {
            collectionViewArray.append(element)
        }
        return collectionViewArray
    }


// инициализируем коллекшн вью
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints =  false
        collectionView.backgroundColor = .systemGray2
// подписываемся под протокол дата сорса
        collectionView.dataSource = self
// подписываемся под протокол делегата
        collectionView.delegate = self
        // создаем ячейку и здесь ее регистрируем
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()

    }

    private func layout() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

    }
}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionViewArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        return cell
    }

}

// MARK: - UICollectionViewDelegate

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat {return 8} //переменная хранящая ширину отступа между элементами collectionView

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 4) / 3  // Расчитываем размер наших ячеек. Получили ширину экрана. Вычли 4 отступа и поделили на 3 пропорциональные части
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }

// метод описывает то как ячейка будет вести себя в пространстве
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
}
