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
        feedButtonOne.backgroundColor = .lightGray
        feedButtonOne.translatesAutoresizingMaskIntoConstraints = false
        feedButtonOne.setTitle("Кнопка 1", for: .normal)
        feedButtonOne.setTitleColor(.white, for: .normal)
        feedButtonOne.layer.cornerRadius = 4
        feedButtonOne.addTarget(self, action: #selector(myButtonAction), for: .touchUpInside)
        return feedButtonOne
    }()


    private lazy var feedButtonTwo: UIButton = {
        let feedButtonTwo = UIButton()
        feedButtonTwo.backgroundColor = .lightGray
        feedButtonTwo.translatesAutoresizingMaskIntoConstraints = false
        feedButtonTwo.setTitle("Кнопка 2", for: .normal)
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

    private func feedLayout() {
        view.addSubview(myStackView)

        NSLayoutConstraint.activate([
            myStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: y/3),
            myStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            myStackView.heightAnchor.constraint(equalToConstant: y/4)
            //  myStackView.widthAnchor.constraint(equalToConstant: 200)
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

/*
    // Создаем в FeedViewController кнопу перехода на PostViewController
    private lazy var myPostButton: UIButton = {

        let myPostButton = UIButton() //Методом backgroundColor задаем ей цвет.
        myPostButton.backgroundColor = .blue //cornerRadius позволит нам скруглить углы и сделать ее более красивой.
        myPostButton.layer.cornerRadius = 12
        //Так же создадим внутри кнопки текст для ее нормального состояния setTitle() и зададим тексту цвет setTitleColor(), если есть желание можем поменять размер и толщину шрифта titleLabel?.font
        myPostButton.setTitle("Перейти на пост", for: .normal)
        myPostButton.setTitleColor(.lightGray, for: .normal)
        myPostButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        //Добавляем кнопке действие addTarget(self, action: #selector(myButtonAction), for: .touchUpInside), для чего мы ее собственно и создали.
        myPostButton.addTarget(self, action: #selector(myButtonAction), for: .touchUpInside)
        //Отключам стандартные ограничения (констрейнты) translatesAutoresizingMaskIntoConstraints = false их мы зададим чуть ниже.
        myPostButton.translatesAutoresizingMaskIntoConstraints = false

        //возвращаем кнопку
        return myPostButton

    }()

    private func mySetupButton() {
        //добавляем нашу кнопку непосредственно на FeedViewController с верстой на экране
        self.view.addSubview(self.myPostButton)
        //верстка (позиционирование) кнопки на экране
        self.myPostButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.myPostButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.myPostButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.myPostButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
    // пишем метод который содержит логику действия после нажатия по кнопке

    @objc private func myButtonAction() {

        let myPostViewController = PostViewController()
        //переходим в PostViewController обычным способом через navigationController
        self.navigationController?.pushViewController(myPostViewController, animated: true)
        //внутри метода buttonAction() присваиваем переменной titlePost значение переменной post
        myPostViewController.myTitlePost = post.title

    }
 */

