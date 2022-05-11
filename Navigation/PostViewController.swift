//
//  PostViewController.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 19.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
    super.viewDidLoad()

              //  self.view.backgroundColor = .lightGray
               // self.navigationItem.title = "Мой пост"
        mySetupView()
            }



    private func mySetupView() {
            self.view.backgroundColor = .lightGray
            self.navigationItem.title = "Мой пост"
        // self.navigationController?.navigationBar.prefersLargeTitles = true
        // self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add")

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
