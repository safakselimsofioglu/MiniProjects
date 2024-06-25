//
//  ViewController.swift
//  NetflixApp - MVVM
//
//  Created by Şafak Selim Sofioğlu on 25.06.2024.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createTabbar()
    }
    
    func createTabbar() {
        let vcFirst = UINavigationController(rootViewController: HomeViewController())
        let vcSecond = UINavigationController(rootViewController: UpComingViewController())
        let vcThird = UINavigationController(rootViewController: SearchViewController())
        let vcFourth = UINavigationController(rootViewController: DownloadViewController())
        //rootViewController, bir iOS uygulamasının temel görüntülenen view controller'ıdır ve uygulamanın görsel hiyerarşisinin başlangıç noktasını belirler.
        
        vcFirst.tabBarItem.image = UIImage(systemName: "house")
        vcSecond.tabBarItem.image = UIImage(systemName: "play.circle")
        vcThird.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vcFourth.tabBarItem.image = UIImage(systemName: "arrow.down.circle")
        
        vcFirst.title = "Home"
        vcSecond.title = "Coming Soon"
        vcThird.title = "Top Search"
        vcFourth.title = "Download"
        
        tabBar.tintColor = .label
        
        setViewControllers([vcFirst, vcSecond, vcThird, vcFourth], animated: true)
    }


}

