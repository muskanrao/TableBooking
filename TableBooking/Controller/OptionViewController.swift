//
//  OptionViewController.swift
//  TableBooking
//
//  Created by Muskan on 28/05/22.
//

import Foundation
import Lottie
import UIKit
import Firebase


class OptionViewController: UIViewController{
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var bookingButton: UIButton!
    @IBOutlet weak var viewBookingButton: UIButton!
    let db = Firestore.firestore()
    var item: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageview)
        view.sendSubviewToBack(imageview)
        bookingButton.layer.cornerRadius = 30
        bookingButton.layer.shadowOpacity = 0.5
        bookingButton.layer.shadowColor = UIColor.black.cgColor
        bookingButton.layer.shadowRadius = 10
        bookingButton.layer.shadowOffset = .zero
        
        viewBookingButton.layer.cornerRadius = 30
        viewBookingButton.layer.shadowOpacity = 0.5
        viewBookingButton.layer.shadowColor = UIColor.black.cgColor
        viewBookingButton.layer.shadowRadius = 10
        viewBookingButton.layer.shadowOffset = .zero
    }
    
    @IBAction func toBookPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ToMakeBooking", sender: self)
    }
    
    @IBAction func ToViewPressed(_ sender: UIButton) {
        loadBooking()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //super.prepare(for: segue, sender: self)
            if segue.identifier == "ToViewBook" {
                let destinationVC = segue.destination as! BookingViewController
                destinationVC.bookingText = item
            }
    }
    

    func loadBooking(){
        var booking = ""
        db.collection("user").getDocuments { (querySnapshot , error) in
            if error != nil{
                print("Error while loading saved data.")
            }else{
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments{
                        let data = doc.data()
                        print(Auth.auth().currentUser?.email)
                        if data["sender"] as! String  == Auth.auth().currentUser?.email {
                            booking = data["bookedSeat"] as! String
                            self.item = booking
                            print(booking)
                            self.performSegue(withIdentifier: "ToViewBook", sender: self)
                            break
                          
                        } //let booking = data["bookedSeat"] as? String{
                            
                            //self.performSegue(withIdentifier: "ToViewBook", sender: self)
                            // print(sender)
                            
                            //self.item = booking
                        }
                    }
                }
            }
        }
    }
    
