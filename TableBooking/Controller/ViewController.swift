//
//  ViewController.swift
//  TableBooking
//
//  Created by Muskan on 25/05/22.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    var animationView: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text = "Shine-DINE ✨"
        animationView = .init(name: "food2")
        //animationView = .init(name: "avocado")
        animationView?.frame = view.bounds
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 0.7
        view.addSubview(animationView!)
        animationView?.play()
        view.sendSubviewToBack(animationView!)
        
        
        
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animationView?.play()
       
    }


}

