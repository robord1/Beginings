//
//  ProfileViewController.swift
//  Beginings
//
//  Created by rob ord on 17/03/2021.
//

import UIKit
import Firebase
class ProfileViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
    
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
