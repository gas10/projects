//
//  LoginView.swift
//  SoccerStar
//
//  Created by Amar Gawade on 3/7/21.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase

class LogInView: UIView, UITextFieldDelegate {
    weak var parentVC: SignUpViewController?
    let errorMessage = "An error occured while creating user account"
    lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "First Name"
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Last Name"
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    lazy var userEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "User Email"
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    lazy var userPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "User Password"
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
    
    lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter First Name"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.delegate = self
        return textField
    }()
    lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Last Name"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.delegate = self
        return textField
    }()
    lazy var userEmailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Email Id"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.delegate = self
        return textField
    }()
    lazy var userPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Password"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.delegate = self
        return textField
    }()
    
    lazy var userLoginButton: UIButton = {
        let button = UIButtonUtil.createUIButton()
        button.tag = 1
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.backgroundColor = .blue
        let attributedTitle = NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.font: UICustomFont.genericFont, NSAttributedString.Key.foregroundColor: UIColor.white])
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    lazy var userSignUpButton: UIButton = {
        let button = UIButtonUtil.createUIButton()
        button.tag = 2
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.backgroundColor = .blue
        let attributedTitle = NSAttributedString(string: "Sign UP", attributes: [NSAttributedString.Key.font: UICustomFont.genericFont, NSAttributedString.Key.foregroundColor: UIColor.white])
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    lazy var firstNameStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstNameLabel, firstNameTextField])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.spacing = UICustomFont.loginFieldSpacing
        stack.isHidden = true
        return stack
    }()
    lazy var lastNameStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [lastNameLabel, lastNameTextField])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.spacing = UICustomFont.loginFieldSpacing
        stack.isHidden = true
        return stack
    }()
    lazy var userEmailStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userEmailLabel, userEmailTextField])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.spacing = UICustomFont.loginFieldSpacing
        return stack
    }()
    lazy var userPasswordStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userPasswordLabel, userPasswordTextField])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.spacing = UICustomFont.loginFieldSpacing
        return stack
    }()
    lazy var buttonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userSignUpButton, userLoginButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = UICustomFont.loginFieldSpacing
        return stack
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstNameStackView, lastNameStackView, userEmailStackView, userPasswordStackView, buttonStackView, errorLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
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
        
        firstNameStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        firstNameStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        lastNameStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        lastNameStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        userEmailStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        lastNameStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        userPasswordStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        lastNameStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        buttonStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        lastNameStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        errorLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true

        firstNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
       
        firstNameTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true

        lastNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        lastNameTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true

        userEmailLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        userEmailTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true

        userPasswordLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        userPasswordTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true

        userLoginButton.widthAnchor.constraint(equalToConstant: 200).isActive = true

        userSignUpButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        if sender.tag == 1 { // login
            let email = userEmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = userPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            checkIfUserExists(email: email, password: password)
        } else if sender.tag == 2 { // signup clicked
            firstNameStackView.isHidden = false
            lastNameStackView.isHidden = false
            userSignUpButton.tag = 3
            let attributedTitle = NSAttributedString(string: "Create Account", attributes: [NSAttributedString.Key.font: UICustomFont.genericFont, NSAttributedString.Key.foregroundColor: UIColor.white])
            userSignUpButton.setAttributedTitle(attributedTitle, for: .normal)
        } else if sender.tag == 3 {
            let error = validateFields()
            if error != nil {
                showError(error!)
            }
            else {
                triggerUserSignUp()
            }
        }
    }
    
    func triggerUserSignUp() {
        // Create cleaned versions of the data
        let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = userEmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = userPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        createUserAccount(firstName: firstName, lastName: lastName, email: email, password: password)
    }
    
    func validateFields() -> String? {
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            userEmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            userPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = userPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if ParsingUtility.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        return nil
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    func createUserAccount(firstName: String, lastName: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            if err != nil {
                self.showError("An error occured while creating user account")
            } else {
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["firstname": firstName, "lastname": lastName, "uid": result!.user.uid]) { (error) in
                    if error != nil {
                        self.showError("An error occured while creating user account")
                    }
                }
                self.goToSoccerGames()
            }
        }
    }
    
    func checkIfUserExists(email: String, password: String) {
        let email = userEmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = userPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.showError(error!.localizedDescription)
            }
            else {
                self.goToSoccerGames()
            }
        }
    }
    
    func goToSoccerGames() {
        guard parentVC != nil else { return }
        parentVC?.openSoccerGames()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
