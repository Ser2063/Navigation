//
//  InfoViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 19.03.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // создаем кнопку
        let myButton = UIButton(frame: CGRect(x: 100, y: 300, width: 150, height: 50))
        //делаем ее дизайн
        myButton.setTitle("Press me", for: .normal)
        myButton.backgroundColor = .red

        //присваиваем кнопке действие 1) указываем себя 2) прописываем селектор  это созданная нами нижн функция 3)указываем действие  нажали и отпустили
        myButton.addTarget(self, action: #selector(tap), for: .touchUpInside)



     // выводим кнопку на вьюху
        view.addSubview(myButton)
    }

    @objc func tap(){

        let myAlert = UIAlertController(title: "Это пиздец", message: "Шел третий день, как я начал делать эту домашнюю задачу 1.3 по лекциям от нетологии по их ТЗ, ютуб мне в помощь. Смогу ли я справиться?", preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Смогу", style: .cancel, handler: {_ in print("cancel")})
        myAlert.addAction(cancelAction)

        let deleteAction = UIAlertAction(title: "Да смогу", style: .destructive, handler: {_ in
            self.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        })
        myAlert.addAction(deleteAction)

        present(myAlert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
