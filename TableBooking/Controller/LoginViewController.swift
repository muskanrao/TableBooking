//
//  LoginViewController.swift
//  TableBooking
//
//  Created by Muskan on 25/05/22.
//

import Foundation
import UIKit
import Lottie
import Firebase

class LoginViewController: UIViewController{
    @IBOutlet weak var logout: UIButton!
    
    @IBOutlet weak var foodView: UIImageView!
    @IBOutlet weak var restroView: UIImageView!
    
    var animationView: AnimationView?
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Email.layer.cornerRadius = 30
        Email.layer.shadowOpacity = 0.5
        Email.layer.shadowColor = UIColor.black.cgColor
        Email.layer.shadowRadius = 10
        Email.layer.shadowOffset = .zero
        
        Password.layer.cornerRadius = 30
        Password.layer.shadowOpacity = 0.5
        Password.layer.shadowColor = UIColor.black.cgColor
        Password.layer.shadowRadius = 10
        Password.layer.shadowOffset = .zero
        
        logout.layer.cornerRadius = 30
        logout.layer.shadowOpacity = 0.5
        logout.layer.shadowColor = UIColor.black.cgColor
        logout.layer.shadowRadius = 10
        logout.layer.shadowOffset = .zero
        
        foodView.layer.cornerRadius = 30
        foodView.layer.shadowOpacity = 0.5
        foodView.layer.shadowColor = UIColor.black.cgColor
        foodView.layer.shadowRadius = 10
        foodView.layer.shadowOffset = .zero
        foodView.transform = foodView.transform.rotated(by: Double.pi*5/6)//CGAffineTransform(rotationAngle: M_PI_2)
        
        restroView.layer.cornerRadius = 30
        restroView.layer.shadowOpacity = 0.5
        restroView.layer.shadowColor = UIColor.black.cgColor
        restroView.layer.shadowRadius = 10
        restroView.layer.shadowOffset = .zero
        restroView.transform = restroView.transform.rotated(by: Double.pi/6)
          
    }

    
    
    @IBAction func LogInButtonPressed(_ sender: UIButton) {
        
        if let email = Email.text, let password = Password.text{
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if error != nil{
                    
                    let alert: UIAlertController
                    alert  = .init(title: "Error while logging in", message: "", preferredStyle: .alert)
                    let action: UIAlertAction
                    action = .init(title: "OK", style: .default, handler: { (action) in
                        print("Error in login")
                    })
                    alert.addAction(action)
                    self!.present(alert, animated: false, completion: nil)
                }else{
                    self?.performSegue(withIdentifier: "LoginToBook", sender: self)
                }
                
            }
            
        }
        
        
        
   }
    
}
