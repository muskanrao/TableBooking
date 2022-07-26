//
//  SignUpViewController.swift
//  TableBooking
//
//  Created by Muskan on 25/05/22.
//

import Foundation
import UIKit
import Lottie
import Firebase

      

class SignUpViewController: UIViewController{
    
    var animationView: AnimationView?
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var FoodView: UIImageView!
    @IBOutlet weak var restroView: UIImageView!
    
    @IBOutlet weak var signUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
       /*
        animationView = .init(name: "scan-menu")
        animationView?.frame = CGRect(x: -150, y: 50, width: 800, height: 600)
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView?.play()
        
        view.sendSubviewToBack(animationView!)
        */
        EmailText.layer.cornerRadius = 30
        EmailText.layer.shadowOpacity = 0.5
        EmailText.layer.shadowColor = UIColor.black.cgColor
        EmailText.layer.shadowRadius = 10
        EmailText.layer.shadowOffset = .zero
        
       // FoodView.transform = FoodView.transform.rotated(by: Double.pi*2/3)
        
        PasswordText.layer.cornerRadius = 30
        PasswordText.layer.shadowOpacity = 0.5
        PasswordText.layer.shadowColor = UIColor.black.cgColor
        PasswordText.layer.shadowRadius = 10
        PasswordText.layer.shadowOffset = .zero
        
        signUp.layer.cornerRadius = 30
        signUp.layer.shadowOpacity = 0.5
        signUp.layer.shadowColor = UIColor.black.cgColor
        signUp.layer.shadowRadius = 10
        signUp.layer.shadowOffset = .zero
        
        FoodView.layer.cornerRadius = 30
        FoodView.layer.shadowOpacity = 0.5
        FoodView.layer.shadowColor = UIColor.black.cgColor
        FoodView.layer.shadowRadius = 10
        FoodView.layer.shadowOffset = .zero
       // FoodView.transform = foodView.transform.rotated(by: Double.pi*5/6)//CGAffineTransform(rotationAngle: M_PI_2)
        
        restroView.layer.cornerRadius = 30
        restroView.layer.shadowOpacity = 0.5
        restroView.layer.shadowColor = UIColor.black.cgColor
        restroView.layer.shadowRadius = 10
        restroView.layer.shadowOffset = .zero

    }

    
    @IBAction func SignUpButtonPressed(_ sender: UIButton) {
        
    
        if let  email = EmailText.text ,let password = PasswordText.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if error != nil{
                    print(error)
                    let alert : UIAlertController
                    let action:UIAlertAction
                    
                    alert = .init(title: "Error while login", message: "", preferredStyle:.alert )
                    
                    action = .init(title: "OK", style: .default, handler: { (action) in
                        print("Okay button pressed")
                        
                    })
                   
                   // present(alert, animated: true, completion: nil)
                    alert.addAction(action)
                    self.present(alert, animated: false, completion: nil)
                    self.dismiss(animated: true, completion: nil)
                    
                }else{
                    self.performSegue(withIdentifier: "SignUpToBook", sender: self)
                }
                
              
          
            }
            
           // Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
              
          
            
        }

    }
    
    
}
