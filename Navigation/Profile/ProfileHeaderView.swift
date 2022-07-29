//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 15.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        profileHeaderViewLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var titleText: String = "Пес Корги "
    private var statusText: String = ""
    private var status: String = ""

    private let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: "IMG_5935.jpeg")
    //    avatarImageView.layer.cornerRadius = 75
     //   avatarImageView.layer.borderWidth = 3
     //   avatarImageView.clipsToBounds = true
     //   avatarImageView.layer.borderColor = UIColor.white.cgColor
        return avatarImageView
    }()


    private lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.text = titleText
        fullNameLabel.textAlignment = .left
        return fullNameLabel
    }()

    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.text = "Waiting for something..."
        return statusLabel
    }()

    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.backgroundColor = .white
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.masksToBounds = true
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return statusTextField
    }()

    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .blue
        setStatusButton.layer.cornerRadius = 12
        setStatusButton.layer.shadowOffset.width = 4
        setStatusButton.layer.shadowOffset.height = 4
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(showStatusbuttonPressed), for: .touchUpInside)
        return setStatusButton
    }()

//анимация

    private var avatarView: UIView = {
    let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        view.clipsToBounds = true
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
            view.layer.cornerRadius = 75
        return view
    }()
    
//анимация
    private var alphaView: UIView = {
    let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .white
        view.backgroundColor = .systemGreen
        view.alpha = 0
        return view
    }()

//анимация
    private var closeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0
        return button
    }()

//анимация
    private let tapGestureRecognizer = UITapGestureRecognizer()
    private var avatarViewHeightConstaint = NSLayoutConstraint()
    private var avatarViewWidhtConstaint = NSLayoutConstraint()
    private var avatarViewTopConstaint = NSLayoutConstraint()
    private var avatarViewLeadingConstaint = NSLayoutConstraint()




    func profileHeaderViewLayouts() {



        addSubview(setStatusButton)
        //анимация выкл addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)

//анимация
        addSubview(avatarView)
        avatarView.addSubview(avatarImageView)

        addSubview(alphaView)
        addSubview(closeButton)

        avatarViewTopConstaint = avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        avatarViewLeadingConstaint = avatarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        avatarViewHeightConstaint = avatarView.heightAnchor.constraint(equalToConstant: 150)
        avatarViewWidhtConstaint = avatarView.widthAnchor.constraint(equalToConstant: 150)


        NSLayoutConstraint.activate([
            avatarViewTopConstaint,
            avatarViewLeadingConstaint,
            avatarViewHeightConstaint,
            avatarViewWidhtConstaint,


            avatarImageView.topAnchor.constraint(equalTo: avatarView.topAnchor),
            avatarImageView.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor),
            avatarImageView.trailingAnchor.constraint(equalTo: avatarView.trailingAnchor),

            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor,constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

            statusLabel.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: -16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),


            statusTextField.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: -10),
            statusTextField.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.widthAnchor.constraint(equalToConstant: 200),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            setStatusButton.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 40),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),

            alphaView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            alphaView.bottomAnchor.constraint(equalTo: bottomAnchor),
            alphaView.leadingAnchor.constraint(equalTo: leadingAnchor),
            alphaView.trailingAnchor.constraint(equalTo: trailingAnchor),

            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            closeButton.heightAnchor.constraint(equalToConstant: 35),
            closeButton.widthAnchor.constraint(equalToConstant: 35)
        ])
    }

  /*
      NSLayoutConstraint.activate([

         avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
         avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
           avatarImageView.heightAnchor.constraint(equalToConstant: 150),

            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),


            statusTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -10),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.widthAnchor.constraint(equalToConstant: 200),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 40),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
*/
    @objc func statusTextChanged(_ statusTextField: UITextField) -> String {
        if let newStatus = statusTextField.text {
            statusText = newStatus
        }
        return  statusText
    }

    func textFieldShouldReturn(_ statusTextField: UITextField) -> Bool {
        statusTextField.resignFirstResponder()
        return true
    }

    @objc
    private func showStatusbuttonPressed() {

        guard statusTextField.text?.isEmpty == false else {return}
        statusLabel.text = statusTextChanged(statusTextField)
        self.statusTextField.text = ""
    }


    /*
     private func showStatusbuttonPressed() {
     guard statusTextField.text?.isEmpty == false else {return}
     statusLabel.text = status
     self.statusTextField.text = ""

     }

     @objc func statusTextChanged(_ textField: UITextField) {
     if let newStatus = textField.text {
     status = newStatus
     }
     }

     */

    /*
     @objc
     func statusTextChanged(statusTextField: UITextField) {
     print(statusText)

     if let status = statusTextField.text {
     statusText = status
     } else {
     statusText = ""
     }

     }

     @objc
     func buttonPressed() {
     if statusText == "" {
     statusTextField.text = "Waiting for something..."
     } else {
     statusLabel.text = statusText
     }

     }
     */
    func changeTitle(title: String) {
        fullNameLabel.text = title
    }
}
