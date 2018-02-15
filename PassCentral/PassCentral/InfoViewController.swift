//
//  InfoViewController.swift
//  PassCentral
//
//  Created by Hieu Tran on 7/31/17.
//  Copyright © 2017 Hieu Tran. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var savedUsername: UILabel!
    @IBOutlet weak var savedPassword: UILabel!
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

    //Straight forward changing labels to fit the saved username/passwords
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = singleTitle[0]
        savedUsername.text = singleTitle[1]
        savedPassword.text = singleTitle[2]

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

        writeMeWithout(row: currentRow)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Listings")
        self.present(nextViewController, animated:true, completion:nil)
    }
    //From delete button, rewrites entirety of entries without the corresponding row (selected combination)
    func writeMeWithout(row : Int) {
        let file = Bundle.main.path(forResource: "passes", ofType: "txt")
        var toBeWritten : String = ""
        var myCounter = 0
        for line in entries {
            if (myCounter != row) {
                toBeWritten.append("\(line)\n")
                print (toBeWritten)
            }
            myCounter += 1
        }
        let endIndex = toBeWritten.index(toBeWritten.endIndex, offsetBy: -3)
        toBeWritten = toBeWritten.substring(to: endIndex)
        do {
            try toBeWritten.write(toFile: file!, atomically: false, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            print ("success")
        }
        catch {
            print(error)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        let message = "Are you sure you want to delete?"
        let alert = UIAlertController(
            title: "\(singleTitle[0])",
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "Yes",
            style: .default,
            handler: switchToListingsScreen)
        let action2 = UIAlertAction(
            title: "No",
            style: .default,
            handler: nil)
        alert.addAction(action)
        alert.addAction(action2)

        present(alert, animated: true, completion: nil)
    }
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Listings")
        self.present(nextViewController, animated:true, completion:nil)
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Listings")
        self.present(nextViewController, animated:true, completion:nil)
    }

    
}
