//
//  ViewController.swift
//  LoginApp2
//
//  Created by Алиага С on 19.6.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let user = User.getUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewController = tabBarController.viewControllers else { return }
        
        viewController.forEach {
            if let welcomVC = $0 as? WelcomeViewController {
                welcomVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                let userInfoVC = navigationVC.topViewController as! UserInfoViewController
                userInfoVC.user = user
            }
        }
    }
    
    @IBAction func logInPressed() {
        if loginTF.text != user.login || passwordTF.text != user.password {
            showAlert(
                title: "Неверный логин или пароль",
                massage: "Пожалуйста повторите попытку",
                textField: passwordTF
            )
            return
        }
    }
    
    @IBAction func forgotRegistrData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Да нет же", massage: "Ваш логин \(user.login)")
        : showAlert(title: "Ну-Ну-Ну", massage: "Ваш пароль \(user.password)")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
    
}

//MARK: - Alert settings in Login area
extension LoginViewController {
    private func showAlert(title: String, massage: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: - Keybord and TF settings
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInPressed()
            performSegue(withIdentifier: "showWVC", sender: nil)
        }
        return true
    }
}

