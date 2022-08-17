//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 19.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let cars = PostModel.dataForCellsModel()

    private let photosTableViewCell = PhotosTableViewCell()

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

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PostTabViewCell.self, forCellReuseIdentifier: String(describing: PostTabViewCell.self))  // регистрируем ячейку PostTableViewCellв таблице
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self)) // регистрируем ячейку PhotosTableViewCell в таблице
        return tableView
    }()

    private let tapGestureRecognizer = UITapGestureRecognizer()  //анимация

    override func viewDidLoad() {
        super.viewDidLoad()
        // view.backgroundColor = .red
        tableLayout()
        setupGesture() //анимация
        setupCloseButtonGesture() //анимация


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

//анимация

// private let tapGestureRecognizer = UITapGestureRecognizer()

    private func setupGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        profileHeaderView.avatarView.addGestureRecognizer(tapGesture)
    }


    @objc private func tapAction(){

        if profileHeaderView.alphaView.alpha == 0 {

        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveLinear) {
            self.profileHeaderView.avatarViewLeadingConstaint.constant = 1
            self.profileHeaderView.avatarViewWidhtConstaint.constant = UIScreen.main.bounds.width - 1
            self.profileHeaderView.avatarViewHeightConstaint.constant = UIScreen.main.bounds.height - 250
           // self.avatarViewBottomConstaint.constant = UIScreen.main.bounds.height - 16
            self.profileHeaderView.avatarViewTopConstaint.constant = 70
            self.profileHeaderView.avatarView.layer.cornerRadius = 0.0
            self.profileHeaderView.alphaViewBottomConstaint.constant = UIScreen.main.bounds.height
            self.profileHeaderView.alphaView.alpha = 0.8
            self.profileHeaderView.closeButton.alpha = 1



            self.view.layoutIfNeeded()
        } completion: { _ in
            self.photosTableViewCell.tableView.isUserInteractionEnabled = false
            self.photosTableViewCell.firstImageView.isUserInteractionEnabled = false
            self.photosTableViewCell.secondImageView.isUserInteractionEnabled = false
            self.photosTableViewCell.thirdImageView.isUserInteractionEnabled = false
            self.photosTableViewCell.fourthImageView.isUserInteractionEnabled = false
            self.photosTableViewCell.arrowImageView.isUserInteractionEnabled = false
            self.photosTableViewCell.photosLabel.isUserInteractionEnabled = false
            self.photosTableViewCell.stackViewVertical.isUserInteractionEnabled = false
            self.photosTableViewCell.stackViewHorizontal.isUserInteractionEnabled = false
            self.photosTableViewCell.stackViewLabels.isUserInteractionEnabled = false

          //  self.tableView.isUserInteractionEnabled = false

           // self.profileHeaderView.closeButton.isUserInteractionEnabled = true
          //  self.profileHeaderView.avatarView.isUserInteractionEnabled = true
        }
        } else {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveLinear) {
            self.profileHeaderView.avatarViewTopConstaint.constant = 16
            self.profileHeaderView.avatarViewLeadingConstaint.constant = 16
            self.profileHeaderView.avatarViewHeightConstaint.constant = 150
            self.profileHeaderView.avatarViewWidhtConstaint.constant = 150
            self.profileHeaderView.avatarView.layer.cornerRadius = 75
            self.profileHeaderView.alphaView.alpha = 0
            self.profileHeaderView.closeButton.alpha = 0
            self.view.layoutIfNeeded()


        }

        }
}

    private func setupCloseButtonGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapCloseButtonAction))
            profileHeaderView.closeButton.addGestureRecognizer(tapGesture)

    }

    @objc private func tapCloseButtonAction() {
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           options: .curveLinear) {
                self.profileHeaderView.avatarViewTopConstaint.constant = 16
                self.profileHeaderView.avatarViewLeadingConstaint.constant = 16
                self.profileHeaderView.avatarViewHeightConstaint.constant = 150
                self.profileHeaderView.avatarViewWidhtConstaint.constant = 150
                self.profileHeaderView.avatarView.layer.cornerRadius = 75
                self.profileHeaderView.alphaView.alpha = 0
                self.profileHeaderView.closeButton.alpha = 0
                self.view.layoutIfNeeded()
            }
    }

//анимация

}

extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.cars.count + 1  //эта запись позволяет не съедать первую ячейку таблицы тоесть первое из четырех значений модели данных не пропадет под коллекшн вью а отобразится после него
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as? PhotosTableViewCell else {
           let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
         return cell
        }
       return cell

        } else {

            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTabViewCell.self), for: indexPath) as? PostTabViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
              cell.setupCell(modelCell: cars[indexPath.row - 1])
               return cell
        }

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

    // при нажатии по ячейке происходит переход на PhotosViewController
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
        self.navigationController?.pushViewController(PhotosViewController(), animated: true)
        } else { return }
    }

}

extension ProfileViewController: UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        gestureRecognizer.profileHeaderView.avatarView == touch.profileHeaderView.avatarView
        }
}



