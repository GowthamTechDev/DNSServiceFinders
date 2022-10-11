//
//  ScanViewController.swift
//  DNSServiceFinder
//
//  Created by Kiran on 09/10/22.
//

import UIKit

class ScanViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(servicePublished), name: Notification.Name("NotificationPost"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("NotificationPost"), object: nil)
    }
    
    //MARK: - Notification Methods Handler

    @objc func servicePublished(){
        tableView.reloadData()
    }
    
}

extension ScanViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ServiceProvider.sharedInstance.services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KeyConstant.CellReuseIdentifiers.scanTableViewCellReuseIdentifier,for: indexPath) as? ScanTableViewCell else { return UITableViewCell()}
        
        let currentService = ServiceProvider.sharedInstance.services[indexPath.row]
        cell.scanLabelFirst.text  = "Service Name = \(currentService.name)"
        cell.scanLabelSecond.text = "Service Type = \(currentService.type) PortNo = \(currentService.port) "
        return cell
    }
    
}
