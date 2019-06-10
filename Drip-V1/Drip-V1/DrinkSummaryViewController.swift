//
//  DrinkSummaryViewController.swift
//  Drip-V1
//
//  Created by William Pintas on 11/9/18.
//  Copyright © 2018 William Pintas. All rights reserved.
//
import FirebaseAuth
import UIKit
import Firebase

class DrinkSummaryViewController:UIViewController{
    
    @IBOutlet weak var additiveLable: UILabel!
    @IBOutlet weak var sizeLable: UILabel!
    
    
   
    @IBAction func changeOrder(_ sender: Any) {
        let cc = self.storyboard?.instantiateViewController(withIdentifier: "addSomething")
        self.present(cc!, animated: false, completion: nil)
    }
    override func viewDidLoad() {
       waitingForData.isHidden = true
        waitingForData.backgroundColor = UIColor(white: 255.0, alpha: 1.0)
        let order = Order.getInstance();
        self.placeInTextBox(additive : order.getAdditive(), size : order.getSize(), order : order)
        super.viewDidLoad()
        self.title = "Drink Summary"
      
      //navigationController?.navigationBar.prefersLargeTitles = true
    
    }

    @IBOutlet weak var waitingForData: UILabel!
    func placeInTextBox(additive : String, size : String, order : Order){
        if(size == "" && additive == ""){
            waitingForData.isHidden = false
            let db = Firestore.firestore()
            let docRef = db.collection("users").document((Auth.auth().currentUser!.uid))
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()
                    order.name = data!["name"] as! String
                    order.size = data!["size"] as! String
                    order.additive = (data!["additive"] as! String)
                    self.additiveLable.text = data!["additive"] as! String
                    self.sizeLable.text = data!["size"] as! String //as! String
                    self.waitingForData.isHidden = true
                } else {
                    print("Document does not exist")
                }
            
        }
            print("wayyyy byyyy")
        }
            else{
                self.additiveLable.text = additive
                self.sizeLable.text = size
            }
    }
  
    @IBAction func signOutTapped(_ sender: Any) {
        let new = true
        let order = Order.getInstance()
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "signInAndSignUpVC")
        self.present(vc!, animated: false, completion: nil)
        try! Auth.auth().signOut()
        //self.dismiss(animated: false, completion: nil)
        //show(vc!, sender: nil)
        
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
