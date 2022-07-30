//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 04.07.2022.
//

import UIKit

class PhotosViewController: UIViewController {

// не создаем модель для collectionView а просто делаем массив

    private var collectionDataSource : [CollectionViewModel] = []


// инициализируем коллекшн вью
     lazy var collectionView: UICollectionView = {
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
        dataSourceSetup()
        self.title = "Photo Gallery"
    }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.navigationBar.isHidden = false
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
    private func dataSourceSetup() {
        for n in 1...21 {
            var name = ""
                if n / 10 < 1 {
                    name = "ko_0\(n)"
                } else {
                    name = "ko_\(n)"
                }
                collectionDataSource.append(CollectionViewModel(image: name))
            }
    }

}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionDataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
// наполнение ячеек изображениями из модели
        let photos = collectionDataSource[indexPath.row]
        cell.photoGalleryImages.image = UIImage(named: photos.image)
        cell.photoGalleryImages.contentMode = .scaleAspectFill
        return cell
    }

    // при нажатии на конкретную картинку всплывает ее просмотр в увеличенном виде
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailPhotoViewController()
        vc.selectedImage = collectionDataSource[indexPath.row].image
        navigationController?.pushViewController(vc, animated: true)
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
