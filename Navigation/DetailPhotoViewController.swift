//
//  DetailPhotoViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 22.07.2022.
//

import Foundation
import UIKit

class DetailPhotoViewController: UIViewController {

    var selectedImage: String?


    private lazy var myContentView1: UIView = {
        let myContentView1 = UIView()
        myContentView1.translatesAutoresizingMaskIntoConstraints = false
        myContentView1.backgroundColor = .white
        return myContentView1
    }()

    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let image = selectedImage {
            imageView.image = UIImage(named: image)
        }
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }


    private func setupView() {

        view.addSubview(myContentView1)
        myContentView1.addSubview(photoImageView)

        NSLayoutConstraint.activate([

            self.myContentView1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.myContentView1.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.myContentView1.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.myContentView1.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),

            self.photoImageView.centerYAnchor.constraint(equalTo: self.myContentView1.centerYAnchor),
            self.photoImageView.leadingAnchor.constraint(equalTo: self.myContentView1.safeAreaLayoutGuide.leadingAnchor),
            self.photoImageView.trailingAnchor.constraint(equalTo: self.myContentView1.safeAreaLayoutGuide.trailingAnchor),
 //           self.photoImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            self.photoImageView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }


}
