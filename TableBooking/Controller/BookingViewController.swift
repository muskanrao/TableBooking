//
//  BookingViewController.swift
//  TableBooking
//
//  Created by Muskan on 27/05/22.
//

import Foundation
import UIKit
import Firebase
import Lottie


class BookingViewController: UIViewController{
    var bookingText: String = ""
    var animatioView: AnimationView?
    
    @IBOutlet weak var donelabel: UILabel!
    @IBOutlet weak var bookedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookedLabel.text = bookingText
        navigationController?.title = "Back"
        animatioView = .init(name: "HotelBook")
        animatioView?.animationSpeed = 1
        animatioView?.loopMode = .loop
        view.addSubview(animatioView!)
        animatioView?.play()
        view.sendSubviewToBack(animatioView!)
        //donelabel.text = "Thank you for your booking, Your table has been reserved."
    }
    
    @IBAction func Pressed(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("OK")
        } catch let signOutError as NSError {
             print("Error signing out: %@", signOutError)
        }
        navigationController?.popToRootViewController(animated: true)
        
        
        
    }
}
