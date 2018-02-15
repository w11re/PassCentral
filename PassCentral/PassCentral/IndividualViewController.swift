//
//  IndividualViewController.swift
//  PassCentral
//
//  Created by Hieu Tran on 7/26/17.
//  Copyright © 2017 Hieu Tran. All rights reserved.
//

import UIKit

class IndividualViewController: UIViewController {
    @IBOutlet weak var titleField: UITextField!
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
    func switchToListingsScreen(action: UIAlertAction) {
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Listings")
        self.present(nextViewController, animated:true, completion:nil)
    }
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Listings")
        self.present(nextViewController, animated:true, completion:nil)
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Listings")
        self.present(nextViewController, animated:true, completion:nil)
    }
    //Writes new combination entry
    func writeMe (t: String, e: String, p: String) {
        let file = Bundle.main.path(forResource: "passes", ofType: "txt")
        var toBeWritten : String = ""
        for line in entries {
            toBeWritten.append("\(line)\n")
        }
        print(file!)
        let newEntry = "\(t) \(e) \(p)"
        toBeWritten.append(newEntry)
        
        do {
            try toBeWritten.write(toFile: file!, atomically: false, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            print ("success")
        }
        catch {
            print(error)
        }
        
        

    }
    //Checks if there are spaces so the readMe doesn't meet an array out of bounds error
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let title = titleField.text!
        let email = emailField.text!
        let password = passwordField.text!
        
        if title.contains(" ") {
            let message = "Invalid Title"
            let alert = UIAlertController(
                title: "Uh oh",
                message: message,
                preferredStyle: .alert)
            let action = UIAlertAction(
                title: "Ok",
                style: .default,
                handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else if email.contains(" ") {
            let message = "Invalid Email"
            let alert = UIAlertController(
                title: "Uh oh",
                message: message,
                preferredStyle: .alert)
            let action = UIAlertAction(
                title: "Ok",
                style: .default,
                handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else if password.contains(" ") {
            let message = "Invalid Password"
            let alert = UIAlertController(
                title: "Uh oh",
                message: message,
                preferredStyle: .alert)
            let action = UIAlertAction(
                title: "Ok",
                style: .default,
                handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            let message = "Email: \(email)\nPassword: \(password)"
            let alert = UIAlertController(
                title: "\(title) - Combo added!",
                message: message,
                preferredStyle: .alert)
            let action = UIAlertAction(
                title: "Ok",
                style: .default,
                handler: switchToListingsScreen)
            
            writeMe(t: title, e: email, p: password)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
    }
}

