//
//  FeedViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 19.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    //создал объект типа Post в FeedViewController для передачи его в PostViewController
    var post = Post(title: "My post 1")

    override func viewDidLoad() {
        super.viewDidLoad()

        mySetupButton()

    }
    // Создаем в FeedViewController кнопу перехода на PostViewController
    private lazy var myPostButton: UIButton = {

        let myPostButton = UIButton()
        //Методом backgroundColor задаем ей цвет.
        myPostButton.backgroundColor = .blue
        //cornerRadius позволит нам скруглить углы и сделать ее более красивой.
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
}


/*
 // MARK: - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

