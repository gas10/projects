//
//  SignUpViewController.swift
//  SoccerStar
//
//  Created by Amar Gawade on 3/7/21.
//

import UIKit

class SignUpViewController: UIViewController {
    var loginView: LogInView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loginView = LogInView(frame: .zero)
        loginView.parentVC = self
        view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loginView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func validate() {
        print("Login/SingUP Tapped")
    }
    
    func openSoccerGames() {
        let soccerHomeVC = SoccerHomeViewController()
        view.window?.rootViewController = soccerHomeVC
        view.window?.makeKeyAndVisible()
    }
}
