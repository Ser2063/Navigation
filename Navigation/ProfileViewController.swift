//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 19.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let cars = PostModel.dataForCellsModel()

    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView(frame: .zero)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false

        return profileHeaderView
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.backgroundColor = .systemGray6
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTabViewCell.self, forCellReuseIdentifier: String(describing: PostTabViewCell.self))  // регистрируем ячейку в таблице

        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // view.backgroundColor = .red
        tableLayout()
    }

    private func tableLayout() {
        view.addSubview(tableView)
        tableView.addSubview(profileHeaderView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            profileHeaderView.topAnchor.constraint(equalTo: tableView.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 50),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 270),
            profileHeaderView.widthAnchor.constraint(equalTo: tableView.widthAnchor)

        ])

    }

}

extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //создание кастомной ячейки

        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTabViewCell.self), for: indexPath) as! PostTabViewCell
        cell.setupCell(modelCell: cars[indexPath.row])
        return cell
    }


}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //  600
        UITableView.automaticDimension //динамическая высота ячейки
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        profileHeaderView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        280
    }
}


