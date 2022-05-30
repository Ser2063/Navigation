//
//  PostTabViewCell.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 24.05.2022.
//

import UIKit

class PostTabViewCell: UITableViewCell {

    private let tableView: UIView = {
        let tableView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        //tableView.layer.cornerRadius = 10
        return tableView
    }()

    private let myTableAuthor: UILabel = {
        let myTableAuthor = UILabel()
        myTableAuthor.translatesAutoresizingMaskIntoConstraints = false
        // myTableAuthor.backgroundColor = .yellow
        // myTableAuthor.text = "Text"
        myTableAuthor.textAlignment = .left
        myTableAuthor.textColor = .black
        myTableAuthor.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        myTableAuthor.numberOfLines = 0
        return myTableAuthor
    }()

    private let myTableImage: UIImageView = {
        let myTableImage = UIImageView()
        myTableImage.translatesAutoresizingMaskIntoConstraints = false
        // myTableImage.backgroundColor = .green
        myTableImage.contentMode = .scaleAspectFill
        myTableImage.clipsToBounds = true
        return myTableImage
    }()

    private let myTableDescription: UILabel = {
        let myTableDescription = UILabel()
        myTableDescription.translatesAutoresizingMaskIntoConstraints = false
        // myTableDescription.backgroundColor = .blue
        // myTableDescription.text = "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"
        //myTableDescription.contentMode = .scaleAspectFill
        myTableDescription.textColor = .gray
        myTableDescription.font = UIFont.systemFont(ofSize: 16)
        myTableDescription.numberOfLines = 0
        return myTableDescription
    }()

    private lazy var myTableStackViewLikes: UIStackView = {
        let myTableStackViewLikes = UIStackView()
        myTableStackViewLikes.axis = .horizontal
        myTableStackViewLikes.spacing = 10
        myTableStackViewLikes.translatesAutoresizingMaskIntoConstraints = false
        //myTableStackViewLikes.backgroundColor = .blue
        myTableStackViewLikes.distribution = .fillEqually
        return myTableStackViewLikes
    }()

    private lazy var myTableLikesLabel: UILabel = {
        let myTableLikesLabel = UILabel()
        //myTableLikesLabel.backgroundColor = .green
        myTableLikesLabel.font = UIFont(name: "System", size: 16)
        myTableLikesLabel.textColor = .black
        myTableLikesLabel.textAlignment = .left
        // myTableLikesLabel.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        myTableLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        return myTableLikesLabel
    }()

    private lazy var myTableViewsLabel: UILabel = {
        let myTableViewsLabel = UILabel()
        //myTableViewsLabel.backgroundColor = .red
        myTableViewsLabel.font = UIFont(name: "System", size: 16)
        myTableViewsLabel.textColor = .black
        myTableViewsLabel.textAlignment = .right
        // myTableViewsLabel.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        myTableViewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return myTableViewsLabel
    }()

    //  private let likes: Int
    // private let views: Int


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customizeCell()
        tableLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //функция принимает массив данных из модели
    func setupCell(modelCell: PostModel) {
        myTableAuthor.text = modelCell.author
        myTableImage.image = modelCell.image
        myTableDescription.text = modelCell.description
        myTableLikesLabel.text = "Likes: \(String(modelCell.likes))"
        myTableViewsLabel.text = "Views: \(String(modelCell.views))"
    }

    private func customizeCell(){

        contentView.backgroundColor = .systemGray3

    }
    private func tableLayout() {
        // contentView.addSubview(tableView)
        // tableView.addSubview(myTableAuthor)
        // tableView.addSubview(myTableImage)
        // tableView.addSubview(myTableDescription)

        [tableView, myTableAuthor, myTableImage, myTableDescription, myTableStackViewLikes].forEach { contentView.addSubview($0)} // заполняем таблицу объектами из массива
        [myTableLikesLabel, myTableViewsLabel].forEach {myTableStackViewLikes.addArrangedSubview($0)}


        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            //     tableView.heightAnchor.constraint(equalToConstant: 500),

            myTableAuthor.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 0),
            myTableAuthor.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 8),
            myTableAuthor.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -8),
            myTableAuthor.heightAnchor.constraint(equalToConstant: 40),

            myTableImage.topAnchor.constraint(equalTo: myTableAuthor.bottomAnchor, constant: 0),
            myTableImage.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 0),
            myTableImage.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 0),
            myTableImage.heightAnchor.constraint(equalToConstant: 200),

            myTableDescription.topAnchor.constraint(equalTo: myTableImage.bottomAnchor, constant: 16),
            myTableDescription.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 16),
            myTableDescription.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -16),
            myTableDescription.bottomAnchor.constraint(equalTo: myTableStackViewLikes.topAnchor, constant: -8),
            //myTableDescription.heightAnchor.constraint(equalToConstant: 200)

            myTableStackViewLikes.topAnchor.constraint(equalTo: myTableDescription.bottomAnchor, constant: 8),
            myTableStackViewLikes.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 16),
            myTableStackViewLikes.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -16),
            myTableStackViewLikes.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -8),
            myTableStackViewLikes.heightAnchor.constraint(equalToConstant: 50)

            // myTableLikesLabel.topAnchor.constraint(equalTo: myTableStackViewLikes.topAnchor, constant: 0),
            //  myTableLikesLabel.leadingAnchor.constraint(equalTo: myTableStackViewLikes.leadingAnchor, constant: 0),
            // myTableLikesLabel.bottomAnchor.constraint(equalTo: myTableStackViewLikes.bottomAnchor, constant: 0),
            //myTableLikesLabel.trailingAnchor.constraint(equalTo: myTableStackViewLikes.trailingAnchor, constant: 0),

            //  myTableViewsLabel.topAnchor.constraint(equalTo: myTableStackViewLikes.topAnchor, constant: 0),
            //  myTableViewsLabel.leadingAnchor.constraint(equalTo: myTableLikesLabel.trailingAnchor, constant: 0),
            //  myTableViewsLabel.bottomAnchor.constraint(equalTo: myTableStackViewLikes.bottomAnchor, constant: 0),
        ])

    }

}
