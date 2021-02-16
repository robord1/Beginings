import UIKit
import FirebaseAuth
class ProfileViewController: UIViewController {
  
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBAction func logoutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            
        } catch  {
            
        }
    
    
    }
    
    
    
    override func viewDidLoad() {
    
    
    super.viewDidLoad()
    

  }
}


