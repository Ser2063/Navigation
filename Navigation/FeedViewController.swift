//
//  FeedViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 19.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "My post 1") //создал объект типа Post в FeedViewController для передачи его в PostViewController
    let x = UIScreen.main.bounds.width //  вычитаем ширину экрана
    let y = UIScreen.main.bounds.height // вычитаем высоту экрана

    private let myStackView: UIStackView = {
        let myStackView = UIStackView()
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        myStackView.axis = .vertical
        myStackView.distribution = .fillEqually
        myStackView.spacing = 10
        return myStackView
    }()

    
    private lazy var feedButtonOne: UIButton = {
        let feedButtonOne = UIButton()
        feedButtonOne.backgroundColor = .systemGray
        feedButtonOne.translatesAutoresizingMaskIntoConstraints = false
        feedButtonOne.setTitle("Жесты и анимация", for: .normal)
        feedButtonOne.setTitleColor(.white, for: .normal)
        feedButtonOne.layer.cornerRadius = 4
        feedButtonOne.addTarget(self, action: #selector(myButtonActionGestureAndAnimation), for: .touchUpInside)
        return feedButtonOne
    }()


    private lazy var feedButtonTwo: UIButton = {
        let feedButtonTwo = UIButton()
        feedButtonTwo.backgroundColor = .systemGray
        feedButtonTwo.translatesAutoresizingMaskIntoConstraints = false
        feedButtonTwo.setTitle("Информация", for: .normal)
        feedButtonTwo.setTitleColor(.white, for: .normal)
        feedButtonTwo.layer.cornerRadius = 4
        feedButtonTwo.addTarget(self, action: #selector(myButtonAction), for: .touchUpInside)
        return feedButtonTwo
    }()

    @objc private func myButtonAction() {

        let myPostViewController = PostViewController()
        //переходим в PostViewController обычным способом через navigationController
        self.navigationController?.pushViewController(myPostViewController, animated: true)
        //внутри метода buttonAction() присваиваем переменной titlePost значение переменной post
        myPostViewController.myTitlePost = post.title

    }

    @objc private func myButtonActionGestureAndAnimation() {

        let myGesturesAndAnimationsController = GesturesAndAnimationsViewController()
        //переходим в PostViewController обычным способом через navigationController
        self.navigationController?.pushViewController(myGesturesAndAnimationsController, animated: true)

    }


    private func feedLayout() {
        view.addSubview(myStackView)

        NSLayoutConstraint.activate([
            myStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: y/3),
            myStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            myStackView.heightAnchor.constraint(equalToConstant: y/4)
            //myStackView.widthAnchor.constraint(equalToConstant: 200)
        ])

        myStackView.addArrangedSubview(feedButtonOne)
        myStackView.addArrangedSubview(feedButtonTwo)

        // print("xxxxxxxxxxxxxxxxxxxx \(x)")
        // print("yyyyyyyyyyyyyyyyyyyy \(y)")

    }


    override func viewDidLoad() {
        super.viewDidLoad()

        //  mySetupButton()
        feedLayout()

    }

}
