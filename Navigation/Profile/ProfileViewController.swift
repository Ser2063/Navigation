//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 19.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    // private let cars: [String] = ["BMW", "Lada", "Kia", "Opel", "Reno", "Skoda", "Volkswagen","BMW", "Lada", "Kia", "Opel", "Reno", "Skoda", "Volkswagen","BMW", "Lada", "Kia", "Opel", "Reno", "Skoda", "Volkswagen","BMW", "Lada", "Kia", "Opel", "Reno", "Skoda", "Volkswagen","BMW", "Lada", "Kia", "Opel", "Reno", "Skoda", "Volkswagen","BMW", "Lada", "Kia", "Opel", "Reno", "Skoda", "Volkswagen"]

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

        // вызов коробочного решения по тэйблВью от эпл
        /*     let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
         //let index = IndexPath(row: <#T##Int#>, section: <#T##Int#>)
         //  cell.textLabel?.text = cars[indexPath.row]
         var content: UIListContentConfiguration = cell.defaultContentConfiguration()
         // content.text = "Секция = \(indexPath.section), ячейка = \(indexPath.row)"
         //content.text = cars[indexPath.row]
         cell.contentConfiguration = content
         return cell

         */
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



/*
 private lazy var secondButton: UIButton = {
 let secondButton = UIButton()
 secondButton.translatesAutoresizingMaskIntoConstraints = false
 secondButton.setTitle("Set title", for: .normal)
 secondButton.setTitleColor(.white, for: .normal)
 secondButton.backgroundColor = .blue
 secondButton.layer.cornerRadius = 12
 secondButton.layer.shadowOffset.width = 4
 secondButton.layer.shadowOffset.height = 4
 secondButton.layer.shadowRadius = 4
 secondButton.layer.shadowColor = UIColor.black.cgColor
 secondButton.layer.shadowOpacity = 0.7
 secondButton.addTarget(self, action: #selector(tapSecondButton), for: .touchUpInside)
 return secondButton
 }()


 override func viewDidLoad() {
 super.viewDidLoad()

 profileHeaderViewSetup()
 }


 private func profileHeaderViewSetup() {
 view.backgroundColor = .lightGray

 view.addSubview(profileHeaderView)
 //    view.addSubview(secondButton)

 NSLayoutConstraint.activate([
 profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
 profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
 profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
 profileHeaderView.heightAnchor.constraint(equalToConstant: 270),

 secondButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
 secondButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 16),
 secondButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
 secondButton.heightAnchor.constraint(equalToConstant: 50)

 ])
 }

 @objc func tapSecondButton() {
 let i = UIAlertController(title: "Установить заголовок", message: "Введите заголовок", preferredStyle: .alert)
 i.addTextField()

 let ok = UIAlertAction(title: "Ok", style: .default) { [weak self, weak i] _ in
 guard let newTitle = i?.textFields?[0].text else {return}
 if newTitle.isEmpty {
 let i = UIAlertController(title: "Вы не ввели текст", message: nil, preferredStyle: .alert)
 let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
 i.addAction(ok)
 self?.present(i, animated: true)
 }
 self?.profileHeaderView.changeTitle(title: newTitle)
 }
 i.addAction(ok)


 let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
 i.addAction(cancel)
 present(i, animated: true)
 }

 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
 self.view.endEditing(true)
 }
 */

