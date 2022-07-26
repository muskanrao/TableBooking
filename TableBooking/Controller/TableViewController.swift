//
//  TableViewController.swift
//  TableBooking
//
//  Created by Muskan on 25/05/22.
//

import Foundation
import UIKit
import Firebase


class TableViewController: UITableViewController{
    @IBOutlet var tableview: UITableView!
    
    let tableArray = ["Beach Shore...✨","roof Top...✨","Open Dinning...✨","Ethnic Grill...✨","Casual Dine...✨","Pub Roofs..✨","Romantic Beach Date Corners...✨","teppanyaki style Pizzerias Grill...✨","Family  Cabin...✨","Galaxy Area...✨","Dine Shine Dates...✨","New..inzz...✨","Beach Shinezz...✨"]
    let db = Firestore.firestore()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Table Booking"
        tableView.rowHeight = 70
      
    }

  //  MARK: -Data Source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableArray.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = self.tableView(tableView, cellForRowAt: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableToBook", for: indexPath)
        cell.textLabel?.text = tableArray[indexPath.row]
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //performSegue(withIdentifier: "BookingCell", sender: self)

        let selectedSeat = tableArray[indexPath.row]
        let storedData = Auth.auth().currentUser?.email
        db.collection("user").addDocument(data: ["sender": storedData,"bookedSeat":selectedSeat]) { (error) in
            if let e = error{
                print("There  is issue while saving data to firestore.\(e)")
            }else{
                print("Succesfully saved")
            }
        }
 
        //print(tableArray[indexPath.row])
        //muskan123@gmail.commuskan123@gmail.com
        //hello123@
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinatioVC = segue.destination as! BookingViewController
        
       if let  indexPath  = tableView.indexPathForSelectedRow{
           destinatioVC.bookingText = tableArray[indexPath.row]
    }
    }
   

    @IBAction func checkPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "BookingCell", sender: self)
        
    }
    
}
