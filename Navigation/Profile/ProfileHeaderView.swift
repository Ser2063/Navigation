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

    private var statusText: String = "Waiting for something..."
    private var titleText: String = "Корги крутые"

    // private var statusButtonTopConstraint: NSLayoutConstraint?
    //  private var statusButtonBottomConstraint: NSLayoutConstraint?

    private let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: "IMG_5935.jpeg")
        avatarImageView.layer.cornerRadius = 59
        avatarImageView.layer.borderWidth = 3
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderColor = UIColor.white.cgColor
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
        statusLabel.text = statusText
        return statusLabel
    }()


    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.masksToBounds = true
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.isHidden = true
        return statusTextField
    }()

    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .blue
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowOffset.width = 4
        setStatusButton.layer.shadowOffset.height = 4
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(tapStatusButton), for: .touchUpInside)
        return setStatusButton
    }()

    private var myStackViewLabels: UIStackView = {
        let myStackViewLabels = UIStackView()
        myStackViewLabels.translatesAutoresizingMaskIntoConstraints = false
        myStackViewLabels.axis = .vertical
        myStackViewLabels.distribution = .fillEqually
        myStackViewLabels.spacing = 10
        return myStackViewLabels
    }()

    private var myStackViewInfo: UIStackView = {
        let myStackViewInfo = UIStackView()
        myStackViewInfo.translatesAutoresizingMaskIntoConstraints = false
        myStackViewInfo.axis = .horizontal
        myStackViewInfo.spacing = 20
        return myStackViewInfo
    }()


    private var statusButtonTopConstraint: NSLayoutConstraint?
    private var statusButtonBottomConstraint: NSLayoutConstraint?

    func profileHeaderViewLayouts() {

        addSubview(myStackViewInfo)
        myStackViewLabels.addArrangedSubview(fullNameLabel)
        myStackViewLabels.addArrangedSubview(statusLabel)
        myStackViewInfo.addArrangedSubview(avatarImageView)
        myStackViewInfo.addArrangedSubview(myStackViewLabels)



        addSubview(setStatusButton)
        addSubview(statusTextField)


        addSubview(myStackViewInfo)

        myStackViewInfo.addArrangedSubview(avatarImageView)
        myStackViewInfo.addArrangedSubview(myStackViewLabels)

        myStackViewLabels.addArrangedSubview(fullNameLabel)
        myStackViewLabels.addArrangedSubview(statusLabel)

        addSubview(setStatusButton)
        addSubview(statusTextField)

        statusButtonTopConstraint = setStatusButton.topAnchor.constraint(equalTo: myStackViewInfo.bottomAnchor, constant: 10)

        NSLayoutConstraint.activate([
            myStackViewInfo.topAnchor.constraint(equalTo: topAnchor),
            myStackViewInfo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -105),
            myStackViewInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            myStackViewInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor, multiplier: 1.0),

            statusButtonTopConstraint,
            setStatusButton.leadingAnchor.constraint(equalTo: myStackViewInfo.leadingAnchor),
            setStatusButton.trailingAnchor.constraint(equalTo: myStackViewInfo.trailingAnchor),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),

            statusTextField.topAnchor.constraint(equalTo: myStackViewInfo.bottomAnchor, constant: 10),
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: myStackViewInfo.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 35)

        ].compactMap({$0}))

    }


    @objc private func tapStatusButton() {
        if statusTextField.isHidden {
            statusButtonBottomConstraint = setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            NSLayoutConstraint.deactivate([statusButtonTopConstraint].compactMap({$0}))
            NSLayoutConstraint.activate([statusButtonBottomConstraint].compactMap({$0}))
            statusTextField.isHidden = false
        } else {
            statusButtonTopConstraint = setStatusButton.topAnchor.constraint(equalTo: self.myStackViewInfo.bottomAnchor, constant: 10)
            NSLayoutConstraint.deactivate([statusButtonBottomConstraint].compactMap({$0}))
            NSLayoutConstraint.activate([statusButtonTopConstraint].compactMap({$0}))

            statusTextField.isHidden = true
            statusLabel.text = statusTextField.text
            if statusLabel.text == "" {
                statusLabel.text = statusText
            }
        }
    }

    func changeTitle(title: String) {
        fullNameLabel.text = title
    }

}


