//
//  LoginViewController.swift
//  VKApp
//
//  Created by Artur Gedakyan on 16.03.2021.
//

import UIKit

/// LoginViewController
final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeybordGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))

        scrollView.addGestureRecognizer(hideKeybordGesture)
        navigationController?.navigationBar.isHidden = true
        
    }
    
    // MARK: - Public methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self, selector: #selector(​keyboardWasShown​),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keybordWillBeHidden),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - IBAction
    @IBAction private func loginActionButton() {
        guard let loginText = loginTextField.text else { return }

        guard let passwordText = passwordTextField.text else { return }

        if loginText == "", passwordText == "" {
            print("Успешная организация")
        } else {
            showAler(title: "Неверный логин или пароль", messsage: "Проверьте данные")
            print("Неуспешная авторизация")
        }
    }

    // MARK: - Private Methods
    @objc private func ​keyboardWasShown​(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height * 1.5, right: 0.0)

        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc private func keybordWillBeHidden(notification _: Notification) {
        let contentInsets = UIEdgeInsets.zero

        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc private func hideKeyboard() {
        scrollView.endEditing(true)
    }
}

// MARK: - Extension
private extension LoginViewController {
    func showAler(title: String, messsage: String) {
        let alertController = UIAlertController(title: title, message: messsage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }

    
}
