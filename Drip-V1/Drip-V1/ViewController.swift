//
//  ViewController.swift
//  Drip-V1
//
//  Created by William Pintas on 11/9/18.
//  Copyright © 2018 William Pintas. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    var TIME = 0;
    
    @IBAction func goNext(_ sender: Any) {
        let order = Order.getInstance()
        order.continueCountDown(time: TIME)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var additiveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let order = Order.getInstance()
        self.timeLable.text = order.timeLeft
        TIME = Int(order.timeLeft)!
        self.runTimer()
        
        self.setLabels()
    }
    
    func setLabels(){
         let order = Order.getInstance()
        self.nameLabel.text = order.name
        self.sizeLabel.text = order.getSize()
        self.additiveLabel.text = order.getAdditive()
        
    }
    func runTimer() {
        var dontstop = true
        Timer.scheduledTimer(withTimeInterval: 60, repeats: dontstop) { (Timer) in
            self.TIME = self.TIME - 1     //This will decrement(count down)the seconds.
            if(self.TIME >= 0){
            self.timeLable.text = String(self.TIME)
            }
            else{
                dontstop = false
            }
        }

    }


}
    
    
   
    


