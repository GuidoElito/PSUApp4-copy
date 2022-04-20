//
//  DataViewModels.swift
//  PSUApp3
//
//  Created by Tony Avella on 1/26/22.
//

import Foundation
import Firebase
import UIKit

class ViewModel: ObservableObject {
    
    @Published var list = [Users]()
    
    func getData() {
            
        let db = Firestore.firestore()
        
        db.collection("Users").getDocuments { snapshot, error in
            
            if error == nil {
                
                if let snapshot = snapshot {
                    
                    self.list = snapshot.documents.map { d in
                        
                        return Users(id: d.documentID,
                                     FirstName: d["First name"] as? String ?? "",
                                      LastName: d["Last name"] as? String ?? "",
                                      Email: d["Email"] as? String ?? "")
                    }
                }
            }
        }
            
    }
    
    func addData(FirstName: String, LastName: String, Email: String) {
        
        let db = Firestore.firestore()
        
        db.collection("Users").addDocument(data: ["Frist name" : FirstName, "Last name" : LastName, "Email" : Email]) { error in
            
            if error == nil {
                //retrieve latest data
                self.getData()
                
            }
            else {
                // handle error
            }
        }
    }
}
