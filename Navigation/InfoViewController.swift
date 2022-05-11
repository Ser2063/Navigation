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

        self.view.backgroundColor = .green


        
        // создаем кнопку
        let myButton = UIButton(frame: CGRect(x: 100, y: 300, width: 150, height: 50))

        //делаем ее дизайн
        myButton.setTitle("Press me", for: .normal)
        myButton.backgroundColor = .red

        //присваиваем кнопке действие 1) указываем себя 2) прописываем селектор  это созданная нами нижн функция 3)указываем действие нажали и отпустили
        myButton.addTarget(self, action: #selector(myTapAction), for: .touchUpInside)

     // выводим кнопку на вьюху
        view.addSubview(myButton)
    }

    // пишем логику метода который указали в селекторе у кнопки
    @objc func myTapAction(){

        let myAlert = UIAlertController(title: "Это сложно", message: "Шел пятый день, как я начал делать эту задачу №4.3 по лекциям от Нетологии. Ютуб мне в помощь. Смогу ли я справиться?", preferredStyle: .alert)

        // при нажатии кнопки печатаем информацию в консоль
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
