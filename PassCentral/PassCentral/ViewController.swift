//
//  ViewController.swift
//  PassCentral
//
//  Created by Hieu Tran on 7/26/17.
//  Copyright © 2017 Hieu Tran. All rights reserved.
//

import UIKit

var login : [String:String] = [
    "admin" : "password"
]
var globalEmail : String = ""

class ViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var rememberPasswordButton: UIButton!
    var passwordButtonChange = true
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Remember password button serves no purpose but change color
    @IBAction func rememberPasswordButtonPressed(_ sender: Any) {
        if passwordButtonChange {
            rememberPasswordButton.backgroundColor = UIColor.blue
            passwordButtonChange = false
        }
        else {
            rememberPasswordButton.backgroundColor = UIColor.cyan
            passwordButtonChange = true
        }
    }
    /*Goes through the login dictionary for usernames/password combinations. Would have probably been better to make a password/pattern for the app. Just showing off dictionaries.
     */
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        let email = emailField.text!
        let password = passwordField.text!
        
        if (emailField.text?.isEmpty)! || (passwordField.text?.isEmpty)! {
            let message = "Please provide an email or password."
            let alert = UIAlertController(
                title: "Something went wrong!",
                message: message,
                preferredStyle: .alert)
            let action = UIAlertAction(
                title: "Ok",
                style: .default,
                handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else if (login[email] != password) {
            let message = "The email or password you provided was incorrect."
            let alert = UIAlertController(
                title: "Email/Password error",
                message: message,
                preferredStyle: .alert)
            let action = UIAlertAction(
                title: "Ok",
                style: .default,
                handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        globalEmail = email
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Listings")
        self.present(nextViewController, animated:true, completion:nil)
    }


    @IBAction func signUpButtonPressed(_ sender: UIButton) {

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SignUp")
        self.present(nextViewController, animated:true, completion:nil)
    }

}

