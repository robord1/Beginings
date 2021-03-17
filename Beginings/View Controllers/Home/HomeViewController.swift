import UIKit

class HomeViewController: UIViewController {

    //var homeNav: HomeNavigationViewController
    
    @IBOutlet var homeView: UIView!

    @IBOutlet weak var containerView: UIView!
    
//    @IBOutlet weak var containerView: UIView!
    
    

    @IBOutlet weak var mainMenuVStack: UIStackView!
    @IBOutlet weak var profileHStack: UIStackView!
    @IBOutlet weak var buttonHStack: UIStackView!
    @IBOutlet weak var streamButton: UIButton!
    @IBOutlet weak var pageButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var notificationsButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var nameButtom: UIButton!
    @IBOutlet weak var usernameButton: UIButton!
    @IBOutlet weak var ppImageButton: UIButton!
    

    let profileSb = UIStoryboard(name: "Profile", bundle: nil)
    lazy var profileViewController: ProfileViewController! = {
        return profileSb.instantiateViewController(withIdentifier: "pro") as! ProfileViewController
    }()
    
    let feedSb = UIStoryboard(name: "Feed", bundle: nil)
    lazy var feedViewController: FeedViewController! = {
        return feedSb.instantiateViewController(withIdentifier: "feed") as! FeedViewController
    }()
    
    let pagesSb = UIStoryboard(name: "Pages", bundle: nil)
    lazy var pagesViewController: PagesViewController! = {
        return pagesSb.instantiateViewController(withIdentifier: "pages") as! PagesViewController
    }()

    let chatSb = UIStoryboard(name: "Chat", bundle: nil)
    lazy var chatViewController: ChatViewController! = {
        return chatSb.instantiateViewController(withIdentifier: "chat") as! ChatViewController
    }()
    
    let notSb = UIStoryboard(name: "Notifications", bundle: nil)
    lazy var notViewController: NotificationsViewController! = {
        return notSb.instantiateViewController(withIdentifier: "not") as! NotificationsViewController
    }()
    
    let searchSb = UIStoryboard(name: "Search", bundle: nil)
    lazy var searchViewController: SearchViewController! = {
        return searchSb.instantiateViewController(withIdentifier: "search") as! SearchViewController
    }()
    
    
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupMenu()
    setupContainer()
    setupSubViews()
    
  }
    

    @IBAction func streamButtonTapped(_ sender: Any) {
        containerView.bringSubviewToFront(feedViewController.view)
        
    }
    @IBAction func pageButtonTapped(_ sender: Any) {
        containerView.bringSubviewToFront(pagesViewController.view)
    }
    @IBAction func chatButtonTapped(_ sender: Any) {
        containerView.bringSubviewToFront(chatViewController.view)
    }
    @IBAction func notificationsButtonTapped(_ sender: Any) {
        containerView.bringSubviewToFront(notViewController.view)
    }
    @IBAction func searchButtonTapped(_ sender: Any) {
        containerView.bringSubviewToFront(searchViewController.view)
    }
    @IBAction func nameButtonTapped(_ sender: Any) {
        containerView.bringSubviewToFront(profileViewController.view)
    }
    @IBAction func usernameButtonTapped(_ sender: Any) {
        containerView.bringSubviewToFront(profileViewController.view)

    }
    @IBAction func ppImageButtonTapped(_ sender: Any) {
        containerView.bringSubviewToFront(profileViewController.view)

    }
    
    func setupContainer(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
           ])
    }
    
    func setupMenu(){
        nameButtom.setTitle("Rob Ord", for: .normal)
        usernameButton.setTitle("@robord", for: .normal)
        ppImageButton.layer.borderWidth = 1.0
        ppImageButton.layer.masksToBounds = false
        ppImageButton.layer.borderColor = UIColor.darkGray.cgColor
        ppImageButton.layer.cornerRadius = ppImageButton.frame.size.width/2
        ppImageButton.clipsToBounds = true
        
    }
    
    func setupSubViews(){
        addChild(searchViewController)
        searchViewController.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(searchViewController.view)
        
        NSLayoutConstraint.activate([
            searchViewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            searchViewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            searchViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            searchViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        addChild(notViewController)
        notViewController.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(notViewController.view)
        
        NSLayoutConstraint.activate([
            notViewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            notViewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            notViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            notViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        addChild(chatViewController)
        chatViewController.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(chatViewController.view)
        
        NSLayoutConstraint.activate([
            chatViewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            chatViewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            chatViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            chatViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
  
        addChild(pagesViewController)
        pagesViewController.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(pagesViewController.view)
        
        NSLayoutConstraint.activate([
            pagesViewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            pagesViewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            pagesViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            pagesViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        addChild(profileViewController)
        profileViewController.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(profileViewController.view)

        NSLayoutConstraint.activate([
            profileViewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            profileViewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            profileViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            profileViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        addChild(feedViewController)
        feedViewController.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(feedViewController.view)
        
        NSLayoutConstraint.activate([
            feedViewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            feedViewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            feedViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            feedViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        

        

    }
    

    

}
