//
//  GesturesAndAnimationsViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 28.07.2022.
//

import UIKit

class GesturesAndAnimationsViewController: UIViewController {

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

    private var alphaView: UIView = {
    let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 0
        return view
    }()

    private var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "IMG_5935"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView

    }()

    private var closeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0
        return button
    }()

    private let tapGestureRecognizer = UITapGestureRecognizer()
//    private var avatarViewCenterXConstaint = NSLayoutConstraint()
//    private var avatarViewCenterYConstaint = NSLayoutConstraint()
    private var avatarViewHeightConstaint = NSLayoutConstraint()
    private var avatarViewWidhtConstaint = NSLayoutConstraint()
    private var avatarViewTopConstaint = NSLayoutConstraint()
    private var avatarViewLeadingConstaint = NSLayoutConstraint()
    private var avatarViewBottomConstaint = NSLayoutConstraint()
  //  private var avatarViewTrailingConstaint = NSLayoutConstraint()

 //   private let screenWidth = UIScreen.main.bounds.width
 //  private let screenHeight = UIScreen.main.bounds.height
 //   private var isExpanded = false


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Жесты и Анимация"
        layout()
        setupGesture()
        setupCloseButtonGesture()
    }
    

    private func layout() {


        view.addSubview(alphaView)
        view.addSubview(avatarView)
        avatarView.addSubview(avatarImageView)
        view.addSubview(closeButton)

        avatarViewTopConstaint = avatarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        avatarViewLeadingConstaint = avatarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        avatarViewHeightConstaint = avatarView.heightAnchor.constraint(equalToConstant: 150)
        avatarViewWidhtConstaint = avatarView.widthAnchor.constraint(equalToConstant: 150)
        avatarViewBottomConstaint = avatarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -166)

        NSLayoutConstraint.activate([
            avatarViewTopConstaint,
            avatarViewLeadingConstaint,
            avatarViewHeightConstaint,
            avatarViewWidhtConstaint,
            avatarViewBottomConstaint,

            avatarImageView.topAnchor.constraint(equalTo: avatarView.topAnchor),
            avatarImageView.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor),
            avatarImageView.trailingAnchor.constraint(equalTo: avatarView.trailingAnchor),

            alphaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            alphaView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            alphaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            alphaView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            closeButton.heightAnchor.constraint(equalToConstant: 35),
            closeButton.widthAnchor.constraint(equalToConstant: 35)
        ])

    }

    private func setupGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        avatarView.addGestureRecognizer(tapGesture)
    }


    @objc private func tapAction(){

        if alphaView.alpha == 0 {

        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       //usingSpringWithDamping: 0.7,
                      // initialSpringVelocity: 0.3,
                       options: .curveLinear) {
            self.avatarViewLeadingConstaint.constant = 1
            self.avatarViewWidhtConstaint.constant = UIScreen.main.bounds.width - 1
            self.avatarViewHeightConstaint.constant = UIScreen.main.bounds.height - 250
           // self.avatarViewBottomConstaint.constant = UIScreen.main.bounds.height - 16
            self.avatarViewTopConstaint.constant = 70
    self.avatarView.layer.cornerRadius = 0.0
            self.alphaView.alpha = 0.5
            self.closeButton.alpha = 1
            self.view.layoutIfNeeded()
        } completion: { _ in
          /*  UIView.animate(withDuration: 0.3,
                           delay: 3,
                           options: .curveLinear) {
                self.avatarViewTopConstaint.constant = 16
                self.avatarViewLeadingConstaint.constant = 16
                self.avatarViewHeightConstaint.constant = 150
                self.avatarViewWidhtConstaint.constant = 150
                self.avatarView.layer.cornerRadius = 75
                self.alphaView.alpha = 0
                self.closeButton.alpha = 0
                self.view.layoutIfNeeded() */
        }
        } else {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveLinear) {
            self.avatarViewTopConstaint.constant = 16
            self.avatarViewLeadingConstaint.constant = 16
            self.avatarViewHeightConstaint.constant = 150
            self.avatarViewWidhtConstaint.constant = 150
            self.avatarView.layer.cornerRadius = 75
            self.alphaView.alpha = 0
            self.closeButton.alpha = 0
            self.view.layoutIfNeeded()
        }

        }
}

    private func setupCloseButtonGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapCloseButtonAction))
        closeButton.addGestureRecognizer(tapGesture)

    }

    @objc private func tapCloseButtonAction() {
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           options: .curveLinear) {
                self.avatarViewTopConstaint.constant = 16
                self.avatarViewLeadingConstaint.constant = 16
                self.avatarViewHeightConstaint.constant = 150
                self.avatarViewWidhtConstaint.constant = 150
                self.avatarView.layer.cornerRadius = 75
                self.alphaView.alpha = 0
                self.closeButton.alpha = 0
                self.view.layoutIfNeeded()
            }
    }


    }





