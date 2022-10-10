//
//  ScanViewController.swift
//  DNSServiceFinder
//
//  Created by Kiran on 09/10/22.
//

import UIKit

class ScanViewController: UIViewController {

    //MARK: -ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ScanViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScanTableViewCell",for: indexPath) as? ScanTableViewCell else { return UITableViewCell()}
        cell.scanLabelFirst.text  = ""
        cell.scanLabelSecond.text = ""
        return cell
    }
    
    
}
