//
//  ViewController.swift
//  SoccerStar
//
//  Created by Amar Gawade on 3/7/21.
//

import UIKit

class ViewController: UIViewController {
    var launchScreenView: LaunchScreenView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        launchScreenView = LaunchScreenView(frame: .zero)
        launchScreenView.parentVC = self
        view.addSubview(launchScreenView)
        launchScreenView.translatesAutoresizingMaskIntoConstraints = false
        launchScreenView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        launchScreenView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        launchScreenView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        launchScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func openLogIn() {
        let signUpVC = SignUpViewController()
        view.window?.rootViewController = signUpVC
        view.window?.makeKeyAndVisible()
    }
    
    func openNavBar() {
        let signUpVC = SoccerHomeViewController()
        signUpVC.modalPresentationStyle = .fullScreen
        view.window?.rootViewController = signUpVC
        view.window?.makeKeyAndVisible()
    }
}

