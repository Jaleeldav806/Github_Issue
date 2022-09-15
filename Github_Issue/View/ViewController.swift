//
//  ViewController.swift
//  Github_Issue
//
//  Created by Jaleel Davidson on 9/9/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let viewModel = ViewModel.init()
   @IBOutlet weak var tblView: UITableView!
   override func viewDidLoad() {
       super.viewDidLoad()
        
        viewModel.callback = {
           let e = self.viewModel.getError()
            DispatchQueue.main.async {
                if e == nil {
                    self.tblView.reloadData()
                } else {
                   print(e.debugDescription)
                }
            }
        }
        viewModel.getDataFromAPI(str: "https://api.github.com/repositories/19438/issues")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getRowCount()
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = viewModel.getDataForCell(at: indexPath.row)
        cell.contentConfiguration = content
        
        return cell
    }


}




