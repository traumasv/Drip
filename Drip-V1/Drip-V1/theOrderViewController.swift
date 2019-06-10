//
//  theOrderViewController.swift
//  Drip-V1
//
//  Created by William Pintas on 12/1/18.
//  Copyright © 2018 William Pintas. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class theOrderViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
     private var db : Firestore?
    @IBAction func goNextPage(_ sender: Any) {
        let order = Order.getInstance()
        let coffeeShopName = order.selectedShop?.mapitem.name
        let user = Auth.auth()
        db = Firestore.firestore()
        db?.collection(coffeeShopName!).document(((user.currentUser?.email)!)).setData(["additive": order.additive,"size": order.size,"name": order.name]) { err in
            if let err = err {
                print("Error writing document: \(err)")
                
            } else {
                let cc = self.storyboard?.instantiateViewController(withIdentifier: "lastPage")
                self.present(cc!, animated: false, completion: nil)
            }
        }

       
    }
    
    @IBOutlet weak var coffeShopLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    let elements = ["15","14","13","12","11","10","9","8","7","6","5"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return elements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("UUUU")
        
        let order = Order.getInstance()
        order.timeLeft = elements[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return elements[row]
        
    }
    func numberOfComponents(pickerView: UIPickerView) -> Int {
        return 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let order = Order.getInstance()
        order.timeLeft = elements[0]
        self.picker.delegate = self
        self.picker.dataSource = self
        coffeShopLabel.text = order.selectedShop!.mapitem.name
        //let order = Order.getInstance()
        //self.coffeStoreLabel.text = order.getName()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
