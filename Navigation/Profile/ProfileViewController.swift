//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 19.03.2022.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {

    let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        //выводим на супервью profileHeaderView
        view.addSubview(profileHeaderView)
        profileHeaderView.myStatusTextField.delegate = self

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        profileHeaderViewSetup()
    }

    private func profileHeaderViewSetup() {

        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            profileHeaderView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            profileHeaderView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    // отображение клавиатуры
    func hideKeyboard() {
        profileHeaderView.myStatusTextField.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }

}
