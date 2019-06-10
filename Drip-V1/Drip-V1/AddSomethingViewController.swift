//
//  AddSomethingViewController.swift
//  Drip-V1
//
//  Created by William Pintas on 11/9/18.
//  Copyright © 2018 William Pintas. All rights reserved.
//

import UIKit

class AddSomethingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var goToNext: UIButton!
    /*
     This function creates the size for each section
     */
    @IBAction func goNext(_ sender: Any) {
        let cc = self.storyboard?.instantiateViewController(withIdentifier: "homeView")
        self.present(cc!, animated: false, completion: nil)

    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return options.count
        } else {
            return sizes.count
        }
    }
    /*this function sets the amount of sections we will have
 */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    /*
 this initilizes the table and fills it with the contents we want
 */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let v = UIView(frame: cell!.frame)
        v.backgroundColor = UIColor(red: 135.0/255, green: 191.0/255, blue: 255.0/255, alpha: 1.0)
        cell?.selectedBackgroundView = v
        cell?.textLabel?.font = UIFont(name: (cell?.textLabel?.font.fontName)!, size: 20)
        
        if indexPath.section == 0 {
            cell?.textLabel?.text = options[indexPath.row]
        } else {
            cell?.textLabel?.text = sizes[indexPath.row]
        }
        
        return cell!
    }
    /*
     this creatrs the section titles
 */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Options"
        } else {
            return "Size"
        }
    }
    var addedAdditive = false
    var addedsize = false
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        if indexPath.section == 0{
            order.setAdditive(additive: options[indexPath.row])
            addedAdditive = true
        } else {
            order.setSize(size: sizes[indexPath.row])
            addedsize = true
            
        }
        if(addedAdditive && addedsize){
            order.putInDatabase()
            goToNext.isEnabled = true
            }
        
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        // Find any selected row in this section
        if let selectedIndexPath = tableView.indexPathsForSelectedRows?.first(where: {
            $0.section == indexPath.section
        }) {
            // Deselect the row
            tableView.deselectRow(at: selectedIndexPath, animated: false)
            // deselectRow doesn't fire the delegate method so need to
            // unset the checkmark here
            tableView.cellForRow(at: selectedIndexPath)?.accessoryType = .none
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        // Prevent deselection of a cell
        return nil
    }
    let order = Order.getInstance()
    let options = ["Skim", "2%","Whole milk", "Half and half", "Cream","Almond milk","Soy milk", "Nothing"]
    let sizes = ["Small", "Medium", "Large"]
    @IBOutlet weak var tableView: UITableView!
   
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.tableFooterView = UIView(frame: tableView.frame)
        tableView.allowsMultipleSelection = true
        goToNext.isEnabled = false
    }
 

}
