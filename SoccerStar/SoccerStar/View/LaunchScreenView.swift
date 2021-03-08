//
//  LaunchScreenView.swift
//  SoccerStar
//
//  Created by Amar Gawade on 3/7/21.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class LaunchScreenView: UIView {
    weak var parentVC: ViewController?
    lazy var headerImageView: UIView = {
        let image = UIImage(named: "soccer_star")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    lazy var textView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Welcome to Soccer Star"
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 10)
        label.isHidden = true
        return label
    }()
    lazy var facebookLoginButton: UIButton = {
        let button = UIButtonUtil.createUIButton()
        button.tag = 1
        button.addTarget(self, action: #selector(loginTapped(_:)), for: .touchUpInside)
        button.backgroundColor = .blue
        let attributedTitle = NSAttributedString(string: "Facebook LogIn", attributes: [NSAttributedString.Key.font: UICustomFont.genericFont, NSAttributedString.Key.foregroundColor: UIColor.white])
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    lazy var googleLoginButton: UIButton = {
        let button = UIButtonUtil.createUIButton()
        button.tag = 2
        button.addTarget(self, action: #selector(loginTapped(_:)), for: .touchUpInside)
        button.backgroundColor = .blue
        let attributedTitle = NSAttributedString(string: "Google LogIn", attributes: [NSAttributedString.Key.font: UICustomFont.genericFont, NSAttributedString.Key.foregroundColor: UIColor.white])
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    lazy var emailLoginButton: UIButton = {
        let button = UIButtonUtil.createUIButton()
        button.tag = 3
        button.addTarget(self, action: #selector(loginTapped(_:)), for: .touchUpInside)
        button.backgroundColor = .blue
        let attributedTitle = NSAttributedString(string: "Email LogIn", attributes: [NSAttributedString.Key.font: UICustomFont.genericFont, NSAttributedString.Key.foregroundColor: UIColor.white])
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    lazy var spacerView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [headerImageView, textView, spacerView, loginButtonStackView, errorLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = UICustomFont.genericSpacing
        return stack
    }()
    
    lazy var loginButtonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [facebookLoginButton, googleLoginButton, emailLoginButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = UICustomFont.genericSpacing
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(stackView)
    }
    
    func setupConstraints() {
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        
        headerImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        headerImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        facebookLoginButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        facebookLoginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        googleLoginButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        googleLoginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        emailLoginButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        emailLoginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        errorLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        errorLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func prepareForReuse() {
        
    }
    
    func updateMutableConstraints() {
        
    }
    
    @objc func loginTapped(_ sender: UIButton) {
        print("Main Login Tapped")
        if sender.tag == 3 {
            guard parentVC != nil else { return }
            parentVC?.openLogIn()
        } else {
            guard parentVC != nil else { return }
            parentVC?.openNavBar()
        }
    }
}
