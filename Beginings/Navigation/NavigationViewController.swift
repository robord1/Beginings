/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

protocol ColoredView {
  var controllerColor: UIColor { get set }
}

class NavigationViewController: UIViewController {
  
  // MARK: - Properties
  var scrollViewController: NavScrollViewController!
  let pb = UIStoryboard(name: "Profile", bundle: nil)
  let eb = UIStoryboard(name: "Event", bundle: nil)
  let hb = UIStoryboard(name: "Home", bundle: nil)
  let cb = UIStoryboard(name: "Create", bundle: nil)
    
  lazy var profileViewController: UIViewController! = {
    return pb.instantiateViewController(withIdentifier: "profileId")
  }()
  
  lazy var eventViewController: UIViewController! = {
    return eb.instantiateViewController(withIdentifier: "eventId")
  }()
  
  lazy var homeViewController: UIViewController! = {
    return hb.instantiateViewController(withIdentifier: "homeId")
  }()

    lazy var createViewController: UIViewController! = {
      return cb.instantiateViewController(withIdentifier: "createId")
    }()
  
  //var cameraViewController: CameraViewController!
  
  // MARK: - IBOutlets
  @IBOutlet var navigationView: NavigationView!
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let controller = segue.destination as? HomeViewController {
        homeViewController = controller
    } else if let controller = segue.destination as? NavScrollViewController {
      scrollViewController = controller
      scrollViewController.delegate = self
    }
  }
}

// MARK: - IBActions
extension NavigationViewController {
  
  @IBAction func handleChatIconTap(_ sender: UITapGestureRecognizer) {
    
    
    scrollViewController.setController(to: profileViewController, animated: true)
  }
  
  @IBAction func handleDiscoverIconTap(_ sender: UITapGestureRecognizer) {
    scrollViewController.setController(to: eventViewController, animated: true)
  }
  
  @IBAction func handleCameraButton(_ sender: UITapGestureRecognizer) {
    scrollViewController.setController(to: homeViewController, animated: true)
  }
}

// MARK: ScrollViewControllerDelegate
extension NavigationViewController: ScrollViewControllerDelegate {
  
  var viewControllers: [UIViewController?] {
    return [homeViewController, eventViewController]
  }
  
  var initialViewController: UIViewController {
    return homeViewController
  }
  
  func scrollViewDidScroll() {
    
    // calculate percentage for animation
    let min: CGFloat = 0
    let max: CGFloat = scrollViewController.pageSize.width
    let x = scrollViewController.scrollView.contentOffset.x
    
    let result = ((x - min) / (max - min)) - 1
    
    navigationView.animate(to: result)
  }
}

