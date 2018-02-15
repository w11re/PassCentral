//
//  ListingsViewController.swift
//  PassCentral
//
//  Created by Hieu Tran on 7/26/17.
//  Copyright © 2017 Hieu Tran. All rights reserved.
//

import UIKit
let pasteBoard = UIPasteboard.general
var singleTitle : [String] = []
var entries : [String] = []
var titles : [String] = ["\(globalEmail)"]
var currentRow : Int = 0

class ListingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        readMe()
        intoTitles()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Titles are emptied and reloaded everytime we get back to this view controller. The first string in the titles array is the email entered from the login screen
    public func intoTitles() {
        titles.removeAll()
        titles = ["\(globalEmail)"]

        for a in entries {
            print (a)
            titles.append(a)
        }
    }

    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView,
                   indentationLevelForRowAt
        indexPath: IndexPath) -> Int {
            return indexPath.row % 1
    }
    func tableView(_ tableView: UITableView,
                   willSelectRowAt indexPath: IndexPath)
        -> IndexPath? {
            if indexPath.row == 0 {
                
                return nil
            } else {
                return indexPath
            }
    }
    func viewInfoButtonPressed (action: UIAlertAction) {
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Info")
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    //Handlers of UIAlertAction useful to transition view controllers with action presses.
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        var trueTitle = titles[indexPath.row].components(separatedBy: " ")
        let rowValue = trueTitle[0]
        let message = "Would you like to view?"
        let controller = UIAlertController(title: "\(rowValue)",
            message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes",
                                   style: .default, handler: viewInfoButtonPressed)
        let action2 = UIAlertAction(title: "No",
                                   style: .default, handler: nil)
        controller.addAction(action)
        controller.addAction(action2)
        singleTitle = trueTitle
        currentRow = indexPath.row - 1
        present(controller, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath)
        -> CGFloat {
            return indexPath.row == 0 ? 70 : 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(
            withIdentifier: simpleTableIdentifier) as UITableViewCell?
        
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCellStyle.subtitle, reuseIdentifier: simpleTableIdentifier)
        }
        
            
        if indexPath.row != 0 {
            cell!.accessoryType = .disclosureIndicator
        }
        var trueTitle = titles[indexPath.row].components(separatedBy: " ")
        cell!.textLabel?.text = trueTitle[0]
        cell!.textLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        cell!.backgroundColor = UIColor.white
        cell?.textLabel?.textColor = UIColor.blue
        cell?.detailTextLabel?.textColor = UIColor.black
        if indexPath.row == 0 {
            cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        }
        return cell!
    }
    //File in bundle called password read and stored into entries variable
    private func readMe() {
        let file = Bundle.main.path(forResource: "passes", ofType: "txt")
        print (file!)
        do {
            let content = try String(contentsOfFile:file!, encoding: String.Encoding.utf8)
            entries = (content.components(separatedBy: "\n"))

        } catch {
            print(error)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
        
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Main")
        self.present(nextViewController, animated:true, completion:nil)
    }
    @IBAction func createLoginButtonPressed(_ sender: UIButton) {
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Individual")
        self.present(nextViewController, animated:true, completion:nil)
    
    
    }

}
