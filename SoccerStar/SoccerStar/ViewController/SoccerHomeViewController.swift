//
//  SoccerHomeViewController.swift
//  SoccerStar
//
//  Created by Amar Gawade on 3/7/21.
//

import UIKit

class SoccerHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createBar()
    }
    
    func createBar() {
        let soccerGames = UINavigationController(rootViewController: SoccerGamesViewController())
        let favoriteGames = UINavigationController(rootViewController: SoccerFavoriteTeamViewController())
        let userSettings = UINavigationController(rootViewController: UserSettingViewController())
        
        soccerGames.title = "Game"
        favoriteGames.title = "Favorite"
        userSettings.title = "Setting"
        
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([soccerGames, favoriteGames, userSettings], animated: true)
        
        let images = ["house", "star", "gear"]
        guard let items = tabBarVC.tabBar.items else { return }
        for index in 0..<items.count {
            items[index].image = UIImage(systemName: images[index])
        }
       
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
}
