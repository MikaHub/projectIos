//
//  LoginViewController.swift
//  deezerApp
//
//  Created by Micael Dos Santos on 15/12/2020.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var loginLabel: UITextField!
    @IBOutlet weak var connexionBtn: UIButton!
    
    var isTouched = false
    var cornerRadius: CGFloat = 30
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initialisation du cornerRadius
        loginLabel.layer.cornerRadius = loginLabel.frame.size.height/2
        loginLabel.clipsToBounds = true
        passwordLabel.layer.cornerRadius = loginLabel.frame.size.height/2
        passwordLabel.clipsToBounds = true
        connexionBtn.layer.cornerRadius = cornerRadius
    }
    
    @IBAction func connexionBtn(_ sender: Any) {
        isTouched.toggle()
        cornerRadius = isTouched ? 0 : 30
        connexionBtn.layer.cornerRadius = cornerRadius
        
        let login = self.loginLabel.text
        let password = self.passwordLabel.text
        
        if login == "nassim" && password == "12345"{
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "tableView") as? TableViewController{
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    
}
