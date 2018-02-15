//
//  SignUpViewController.swift
//  PassCentral
//
//  Created by Hieu Tran on 7/26/17.
//  Copyright © 2017 Hieu Tran. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func switchToLoginScreen(action: UIAlertAction) {
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Main")
        self.present(nextViewController, animated:true, completion:nil)
    }
    //Checks for @.com for email and >3 characters for password
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        let email = emailField.text
        let password = passwordField.text
        if !((email?.contains(".com"))! && (email?.contains("@"))!) {
            let message = "Not a valid email!"
            let alert = UIAlertController(
                title: "Email Error",
                message: message,
                preferredStyle: .alert)
            let action = UIAlertAction(
                title: "That's so true!",
                style: .default,
                handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else if (password?.characters.count)! < 4 {
            let message = "Not a valid password"
            let alert = UIAlertController(
                title: "Password Error",
                message: message,
                preferredStyle: .alert)
            let action = UIAlertAction(
                title: "That's so true!",
                style: .default,
                handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            let message = "Email: \(email!)\n"
            let alert = UIAlertController(
                title: "Signed Up! (Not really)",
                message: message,
                preferredStyle: .alert)
            let action = UIAlertAction(
                title: "Ok",
                style: .default,
                handler: switchToLoginScreen)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            login[email!] = password!
        }
    }

    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Main")
        self.present(nextViewController, animated:true, completion:nil)
    }
}
