//
//  PostViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 19.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    //Cоздаем переменную для заголовка поста в PostViewController
        var myTitlePost: String = "My post"
        

    override func viewDidLoad() {
    super.viewDidLoad()

                self.view.backgroundColor = .lightGray
               // self.navigationItem.title = "Мой пост"
                //self.navigationItem.title = myTitlePost
        mySetupView()
            }



    private func mySetupView() {
            self.view.backgroundColor = .lightGray
        //  self.navigationItem.title = "Мой пост"
        // Заменяем обычный заголовок "Мой пост" на переменную
         self.navigationItem.title = myTitlePost

        // self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(myButtonActionInfo))


    }

    @objc private func myButtonActionInfo() {

            let myInfoViewController = InfoViewController()
        //вызываем InfoViewController модально
        self.present(myInfoViewController, animated: true, completion: nil)

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
