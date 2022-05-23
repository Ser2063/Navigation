//
//  LogInViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 23.05.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private let nc = NotificationCenter.default  //клавиатура

    private lazy var myScrollView: UIScrollView = {
        let myScrollView = UIScrollView()
        myScrollView.translatesAutoresizingMaskIntoConstraints = false
        //myScrollView.backgroundColor = .red
        return myScrollView
    }()

    private lazy var myContentView: UIView = {
        let myContentView = UIView()
        myContentView.translatesAutoresizingMaskIntoConstraints = false
        myContentView.backgroundColor = .white
        return myContentView
    }()

    private lazy var myLogoImageView: UIImageView = {
        let myLogoImageView = UIImageView(image: UIImage(named: "logo.png"))
        myLogoImageView.clipsToBounds = true
        myLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        return myLogoImageView
    }()

    private lazy var myLogAndPassStackView: UIStackView = {
        let myLogAndPassStackView = UIStackView()
        myLogAndPassStackView.translatesAutoresizingMaskIntoConstraints = false
        myLogAndPassStackView.backgroundColor = .systemGray6
        myLogAndPassStackView.clipsToBounds = true
        myLogAndPassStackView.axis = .vertical
        myLogAndPassStackView.distribution = .fillEqually
        myLogAndPassStackView.layer.borderWidth = 0.5
        myLogAndPassStackView.layer.cornerRadius = 10
        myLogAndPassStackView.layer.borderColor = UIColor.lightGray.cgColor
        return myLogAndPassStackView
    }()

    private lazy var myLogTextField: UITextField = {
        let myLogTextField = UITextField()
        myLogTextField.translatesAutoresizingMaskIntoConstraints = false
        myLogTextField.backgroundColor = .systemGray6
        myLogTextField.textColor = .black
        myLogTextField.autocapitalizationType = .none
        myLogTextField.font = .systemFont(ofSize: 16)
        myLogTextField.placeholder = "Email or phone number"
        myLogTextField.layer.borderWidth = 0.5
        myLogTextField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: myLogTextField.frame.height))
        myLogTextField.leftViewMode = .always
        myLogTextField.layer.borderColor = UIColor.lightGray.cgColor
        myLogTextField.delegate = self // чтобы клавиатура убиралась делаем делегата и внизу под классом делаем экстеншн и еще пишем прайвал лэйзи вар
        return myLogTextField
    }()

    private lazy var myPassTextField: UITextField = {
        let myPassTextField = UITextField()
        myPassTextField.translatesAutoresizingMaskIntoConstraints = false
        myPassTextField.backgroundColor = .systemGray6
        myPassTextField.isSecureTextEntry = true
        myPassTextField.textColor = .black
        myPassTextField.autocapitalizationType = .none
        myPassTextField.font = .systemFont(ofSize: 16)
        myPassTextField.placeholder = "Password"
        myPassTextField.layer.borderWidth = 0.5
        myPassTextField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: myPassTextField.frame.height))
        myPassTextField.leftViewMode = .always
        myPassTextField.layer.borderColor = UIColor.lightGray.cgColor
        myPassTextField.delegate = self
        return myPassTextField
    }()

    private lazy var myLogInButton: UIButton = {
        let myLogInButton = UIButton()
        myLogInButton.setTitle("Log In", for: .normal)
        myLogInButton.setBackgroundImage(UIImage(named: "blue_pixel.png"), for: .normal)
        myLogInButton.layer.cornerRadius = 10
        myLogInButton.clipsToBounds = true
        myLogInButton.addTarget(self, action: #selector(self.myButtonPush), for: .touchUpInside)
        myLogInButton.translatesAutoresizingMaskIntoConstraints = false
        return myLogInButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        addingElementsIntoSubviews()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardDidHideNotification, object: nil)

    }

    override func viewDidDisappear (_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }


    @objc private func kbdShow(notification: NSNotification){
        if let kbdSize =
            (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
             NSValue)?.cgRectValue {
            myScrollView.contentInset.bottom = kbdSize.height
            myScrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)

        }

    }

    @objc private func kbdHide(notification: NSNotification){
        myScrollView.contentInset.bottom = .zero
        myScrollView.verticalScrollIndicatorInsets = .zero

    }
    private func addingElementsIntoSubviews() {

        view.addSubview(myScrollView)
        myScrollView.addSubview(myContentView)
        myContentView.addSubview(myLogInButton)
        myContentView.addSubview(myLogoImageView)
        myContentView.addSubview(myLogAndPassStackView)
        myLogAndPassStackView.addArrangedSubview(myLogTextField)
        myLogAndPassStackView.addArrangedSubview(myPassTextField)

        NSLayoutConstraint.activate([

            myScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            myContentView.topAnchor.constraint(equalTo: myScrollView.topAnchor),
            myContentView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor),
            myContentView.leadingAnchor.constraint(equalTo: myScrollView.leadingAnchor),
            myContentView.trailingAnchor.constraint(equalTo: myScrollView.trailingAnchor),
            myContentView.widthAnchor.constraint(equalTo: myScrollView.widthAnchor),
            myContentView.heightAnchor.constraint(equalTo: myScrollView.heightAnchor),

            myLogoImageView.topAnchor.constraint(lessThanOrEqualTo: myContentView.topAnchor, constant: 120),
            myLogoImageView.centerXAnchor.constraint(equalTo: myContentView.centerXAnchor),
            myLogoImageView.widthAnchor.constraint(equalToConstant: 100),
            myLogoImageView.heightAnchor.constraint(equalToConstant: 100),
            myLogoImageView.bottomAnchor.constraint(greaterThanOrEqualTo: myLogAndPassStackView.topAnchor, constant: -70),

            myLogAndPassStackView.centerYAnchor.constraint(equalTo: myContentView.centerYAnchor),
            myLogAndPassStackView.leadingAnchor.constraint(equalTo: myContentView.leadingAnchor, constant: 16),
            myLogAndPassStackView.trailingAnchor.constraint(equalTo: myContentView.trailingAnchor, constant: -16),
            myLogAndPassStackView.heightAnchor.constraint(equalToConstant: 100),

            myLogInButton.topAnchor.constraint(equalTo: myLogAndPassStackView.bottomAnchor, constant: 16),
            myLogInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myLogInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            myLogInButton.heightAnchor.constraint(equalToConstant: 50)

        ])

    }

    @objc private func myButtonPush() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
        navigationController?.navigationBar.isHidden = true
    }


}
// для клавиатуры чтоб она убиралась
extension LogInViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
