//
//  ViewController.swift
//  PSUApp3
//
//  Created by Tony Avella on 1/25/22.
//

import UIKit
import Firebase
import Foundation
import SwiftUI

class ViewController: UIViewController, UITextFieldDelegate {
    
    @ObservedObject var model = ViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    //declaration of action items
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBAction func Submit( Sender: Any) {
        //converting UITextField to String
        let Fname: String = FirstName.text!
        let Lname: String = LastName.text!
        let email: String = Email.text!

        //calling the addData function
        model.addData(FirstName: Fname, LastName: Lname, Email: email)
    }
   
}
