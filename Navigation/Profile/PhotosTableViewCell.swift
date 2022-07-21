//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 01.06.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {


    private let tableView: UIView = {
        let tableView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.clipsToBounds = true
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.gray.cgColor
        //tableView.layer.cornerRadius = 10
        return tableView
    }()

// стак вью для размещения двух блоков верхний для стрелки и слова Фото нижний для горизонтального стаквью с 4 фотками
    private lazy var stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        return stackView
    }()

    // стак вью для размещения 4х фото
    private lazy var stackViewHorizontal: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var stackViewLabels: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()

    private lazy var firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "ko_01")
        return imageView
    }()

    private lazy var secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "ko_02")
        return imageView
    }()

    private lazy var thirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "ko_03")
        return imageView
    }()

    private lazy var fourthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "ko_04")
        return imageView
    }()

    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        return label
    }()

    private lazy var arrowImageView: UIImageView = {
        let arrow = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = arrow
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        tableLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func tableLayout() {
        contentView.addSubview(tableView)
        tableView.addSubview(stackViewVertical)
        stackViewLabels.addSubview(photosLabel)
        stackViewLabels.addSubview(arrowImageView)
        stackViewVertical.addSubview(stackViewLabels)
        stackViewVertical.addSubview(stackViewHorizontal)
        stackViewHorizontal.addSubview(firstImageView)
        stackViewHorizontal.addSubview(secondImageView)
        stackViewHorizontal.addSubview(thirdImageView)
        stackViewHorizontal.addSubview(fourthImageView)


        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            tableView.heightAnchor.constraint(equalToConstant: 140),

            stackViewVertical.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 12),
            stackViewVertical.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 12),
            stackViewVertical.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -12),
            stackViewVertical.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -12),
            //stackViewVertical.heightAnchor.constraint(equalToConstant: 40),

            arrowImageView.heightAnchor.constraint(equalTo: arrowImageView.widthAnchor, multiplier: 0.8),
            arrowImageView.widthAnchor.constraint(equalTo: arrowImageView.heightAnchor, multiplier: 1),
            stackViewLabels.heightAnchor.constraint(equalToConstant: 12)

        ])

    }
}
