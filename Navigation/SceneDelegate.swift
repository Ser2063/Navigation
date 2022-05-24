//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 18.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        //сделал окно в котором телефон отрисует программу
        window = UIWindow(windowScene: scene)
        // делаем окно ключевым и видимым
        window?.makeKeyAndVisible()

        //создаем UITapBar

        let myTabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .secondarySystemBackground
        UITabBar.appearance().alpha = 0.9

        //myTabBarController.tabBar.isTranslucent = false

        //объявляем вью контроллеры для каждой из будущих кнопок на таб баре в виде констант. Сколько кнопок будет на таб баре столько же нужно и констант с вью контроллерами
        let myFeedVC = FeedViewController()
        let myProfileVC = ProfileViewController()
        let myPostVC = PostViewController()
        let myLogInVC = LogInViewController()
        //вью контроллеры по умолчанию прозрачные и окно сейчас прозрачное нужно задать им цвет
        myFeedVC.view.backgroundColor = .blue
        myProfileVC.view.backgroundColor = .lightGray
        myLogInVC.view.backgroundColor = .white
        // присваиваем название вьюхам
        myFeedVC.title = "Feed"
        myProfileVC.title = "Profile"
        myPostVC.title = "Post"
        myLogInVC.title = "Log In"
        //добавляем кнопки для отображения на таб баре
        myFeedVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "list.dash.header.rectangle"), selectedImage: UIImage(systemName: "list.dash.header.rectangle"))
      // myProfileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        myLogInVC.tabBarItem = UITabBarItem(title: "Log In", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))

        // создаем UINavigationController - это белая полоска сверху экрана ниже челки
        let myFeedNavVC = UINavigationController(rootViewController: myFeedVC)
        //  myFeedNavVC.navigationBar.backgroundColor = UIColor(white: 1, alpha: 0.5)
        //let myProfileNavVC = UINavigationController(rootViewController: myProfileVC)
        //myProfileNavVC.navigationBar.backgroundColor = UIColor(white: 1, alpha: 0.5)
        let myLogInNavVC = UINavigationController(rootViewController: myLogInVC)




        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .secondarySystemBackground.withAlphaComponent(0.5)
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        

        // запихиваем в таб бар в виде массива эти кнопки
        //myTabBarController.viewControllers = [myFeedNavVC, myProfileNavVC]
        myTabBarController.viewControllers = [myFeedNavVC, myLogInNavVC]

        // запихиваем в таб бар в виде массива эти кнопки
        //   myTabBarController.viewControllers = [myFeedVC, myProfileVC]

        //присваеваем рут вью контроллер и запихиваем в него тап бар
        window?.rootViewController = myTabBarController

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

