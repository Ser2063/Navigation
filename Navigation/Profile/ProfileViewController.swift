//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 19.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView(frame: .zero)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
    
    private lazy var secondButton: UIButton = {
        let secondButton = UIButton()
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.setTitle("Set title", for: .normal)
        secondButton.setTitleColor(.white, for: .normal)
        secondButton.backgroundColor = .blue
        secondButton.layer.cornerRadius = 4
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
        view.addSubview(secondButton)
        
        NSLayoutConstraint.activate([
          profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
          profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
          profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
          profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

           
            secondButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            secondButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 20),
            secondButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
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
    
}
