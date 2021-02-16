//
//  AppNavigationViewController.swift
//  Beginings
//
//  Created by rob ord on 10/02/2021.
//

import UIKit
import FirebaseAuth
class AppNavigationViewController: UIViewController {

    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBAction func logoutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            
        } catch  {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
