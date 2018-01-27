//
//  AccountViewController.swift
//  swift-api_reboot
//
//  Created by Prescilla Lecurieux on 21/01/2018.
//  Copyright © 2018 esgi. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var textFieldTag: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var newTextFieldTag: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textFieldTag.delegate = self
        self.textFieldPassword.delegate = self
        
        self.title = "Overwatch-api"
    }
    
    @IBAction func buttonSave(_ sender: UIButton) {
        guard let tag = self.textFieldTag.text, let password = self.textFieldPassword.text else {
            return
        }
        
        if !tag.isEmpty && !password.isEmpty {
            
            if tag == "root" && password == "root" {
                let alert = UIAlertController(title: "Access granted", message: "Administrator mode", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Fermer", style: .cancel))
                self.present(alert, animated: true)
            }
            displayProfile(tag: tag)
        }
        else {
            print("il faut remplir tous les champs !")
        }
    }
    
    func displayProfile(tag: String) {
        let playerTag = tag
        let profileViewController = ProfileViewController()
        profileViewController.selectedPlayer = playerTag
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
}

extension AccountViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if self.textFieldTag == textField {
            self.textFieldPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}

