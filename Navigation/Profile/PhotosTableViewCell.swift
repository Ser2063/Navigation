//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 01.06.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {


     let tableView: UIView = {
        let tableView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.backgroundColor = .systemRed
        tableView.clipsToBounds = true
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.gray.cgColor
        //tableView.layer.cornerRadius = 10
        return tableView
    }()

// стак вью для размещения двух блоков верхний для стрелки и слова Фото нижний для горизонтального стаквью с 4 фотками
     lazy var stackViewVertical: UIStackView = {
        let stackViewVertical = UIStackView()
       // stackViewVertical.backgroundColor = .yellow
        stackViewVertical.translatesAutoresizingMaskIntoConstraints = false
        stackViewVertical.axis = .vertical
        stackViewVertical.spacing = 12
        stackViewVertical.distribution = .fillProportionally
        return stackViewVertical
    }()

    // стак вью для размещения 4х фото
     lazy var stackViewHorizontal: UIStackView = {
        let stackViewHorizontal = UIStackView()
       // stackViewHorizontal.backgroundColor = .green
        stackViewHorizontal.translatesAutoresizingMaskIntoConstraints = false
        stackViewHorizontal.axis = .horizontal
        stackViewHorizontal.spacing = 8
        stackViewHorizontal.distribution = .fillEqually
        return stackViewHorizontal
    }()

     lazy var stackViewLabels: UIStackView = {
        let stackViewLabels = UIStackView()
        stackViewLabels.translatesAutoresizingMaskIntoConstraints = false
        stackViewLabels.axis = .horizontal
        //stackViewLabels.spacing = 10
        stackViewLabels.distribution = .fillProportionally
        return stackViewLabels
    }()

     lazy var firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "ko_01")
        return imageView
    }()

     lazy var secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "ko_02")
        return imageView
    }()

     lazy var thirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "ko_03")
        return imageView
    }()

     lazy var fourthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "ko_04")
        return imageView
    }()

     lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        return label
    }()

     lazy var arrowImageView: UIImageView = {
        let arrow = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = arrow
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
         //imageView.backgroundColor = .red
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
        [photosLabel, arrowImageView].forEach {stackViewLabels.addArrangedSubview($0)}
        [firstImageView, secondImageView, thirdImageView, fourthImageView].forEach {stackViewHorizontal.addArrangedSubview($0)}
        [stackViewLabels, stackViewHorizontal].forEach {stackViewVertical.addArrangedSubview($0)}


        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            tableView.heightAnchor.constraint(equalToConstant: 164),

            stackViewVertical.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 12),
            stackViewVertical.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 12),
            stackViewVertical.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -12),
            stackViewVertical.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -12),
           // stackViewVertical.heightAnchor.constraint(equalToConstant: 140),

            stackViewLabels.topAnchor.constraint(equalTo: stackViewVertical.topAnchor, constant: 0),
            stackViewLabels.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor, constant: 0),
            stackViewLabels.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor, constant: 0),
            stackViewLabels.bottomAnchor.constraint(equalTo: stackViewHorizontal.topAnchor, constant: 0),
            stackViewLabels.heightAnchor.constraint(equalToConstant: 40),

            stackViewHorizontal.topAnchor.constraint(equalTo: stackViewLabels.bottomAnchor, constant: 0),
            stackViewHorizontal.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor, constant: 0),
            stackViewHorizontal.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor, constant: 0),
            stackViewHorizontal.bottomAnchor.constraint(equalTo: stackViewVertical.bottomAnchor, constant: 0),
            stackViewHorizontal.heightAnchor.constraint(equalToConstant: 100)
        ])

    }

   
}
