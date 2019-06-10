//
//  OrderClass.swift
//  Drip-V1
//
//  Created by Joey Park on 11/16/18.
//  Copyright © 2018 William Pintas. All rights reserved.
//
import Firebase
import FirebaseAuth
import Foundation
public class Order{
    
   // FirebaseApp.configure()
    
    private var db : Firestore?//.firestore()

    public var additive: String;
    public var name: String
    public var size : String;
    private let user = Auth.auth()
    public static var order : Order?
    public var selectedShop : CoffeeShop?
    public var timeLeft: String
    private init() {
        additive = ""
        size = ""
        timeLeft = "15"
        name = ""
    }
    
    
    public func getShop() -> CoffeeShop?{
        return selectedShop
    }
    
    public func getSize() -> String{
        return size
    }
    
    public func getAdditive() -> String{
        print("getAdditive: \(additive)")
        return additive
    }
    
    public static func getInstance()->Order{
        if (self.order == nil){
            self.order = Order()
        }
        return self.order!
    }
    
    public func setName(name : String){
        self.name = name
    }
    public func setAdditive(additive : String){
            self.additive = additive
        }
   
    public  func setSize(size : String){
        self.size = size
    }
    
    public func continueCountDown(time : Int){
        self.timeLeft = String(time)
        var TIME = time
        var dontstop = true
        Timer.scheduledTimer(withTimeInterval: 60, repeats: dontstop) { (Timer) in
            TIME = TIME - 1    //This will decrement(count down)the seconds.
            if(TIME >= 0){
                self.timeLeft = String(TIME)
            }
            else{
                dontstop = false
            }
    }
    }

    
    public func putInDatabase() -> Bool{
        var worked = false
        db = Firestore.firestore()
        db?.collection("users").document((user.currentUser!.uid)).setData(["additive": additive,"size": size,"name": name]) { err in
            if let err = err {
                print("Error writing document: \(err)")

            } else {
                  print("Document successfully written!")
                    worked = true
            }
        }
        return worked
    }
    
    
    
}


/*enum Additive : String {
    case skim = "skim"
    case twopercent = "twopercent"
    case whole = "whole"
    case halfandhalf = "halfandhalf"
    case cream = "cream"
    case almond = "almond"
    case soy = "soy"
    case nope = "nope"
}
enum Size : String {
    case small = "small"
    case medium = "medium"
    case large = "large"
}
*/
