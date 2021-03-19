//
//  FeedViewController.swift
//  Beginings
//
//  Created by rob ord on 17/03/2021.
//

import UIKit

class itemData{
    var text: String?
}

class NormalCell: UITableViewCell{
    @IBOutlet weak var label: UILabel!
    
}


class TopCell: UITableViewCell{
    
    

}




class FeedTableViewController: UITableViewController {

    
    var tableData = [0,"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"] as [Any]
    var homeVC: HomeViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("Memory warning!")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return 370
        }else if indexPath.row == tableData.count-1{
            return 400
        }
        else{
            return 100
        }
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
//
//
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let string = self.tableData[indexPath.row] as? String
        {
            let cell:NormalCell = self.tableView.dequeueReusableCell(withIdentifier: "normalCell") as! NormalCell
            cell.label?.text = "\(indexPath.row)"
            return cell
        }else{

            
            let cell:TopCell = self.tableView.dequeueReusableCell(withIdentifier: "topCell") as! TopCell
            
            return cell
        }
        
//        return UITableViewCell()
        
    }

    
    
    
    func hideHome(){
        homeVC?.isHomeMenuVisible(state: false)
    }
    func showHome(){
        homeVC?.isHomeMenuVisible(state: true)
    }


}
