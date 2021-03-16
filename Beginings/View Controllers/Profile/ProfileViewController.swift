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
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        
        let profileScroll = UIScrollView(frame: CGRect(x: 10, y: 10, width: view.frame.size.width, height: view.frame.size.height))
        profileScroll.backgroundColor = .green
        //view.addSubview(profileScroll)
        
        
        let top = UIButton(frame: CGRect(x:30,y:30,width: 100, height: 100))
        top.backgroundColor = .blue
        profileScroll.addSubview(top)
        
        let x = TopBar(frame: CGRect(x:30,y:30,width: 100, height: 100))
        profileScroll.addSubview(x)
        view.addSubview(x)
        
        
        let bottom = UIButton(frame: CGRect(x:30,y:2000,width: 100, height: 100))
        bottom.backgroundColor = .blue
        profileScroll.addSubview(bottom)
        
        profileScroll.contentSize = CGSize(width: view.frame.width, height: 2500)
    }
    
    

}


