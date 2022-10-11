//
//  PublishViewController.swift
//  DNSServiceFinder
//
//  Created by Kiran on 09/10/22.
//

import UIKit

final class PublishViewController: UIViewController {
    
    @IBOutlet weak var statusLbl: UILabel!
    
    //MARK: -ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.publishScanProtocol = self
        self.statusLbl.text = KeyConstant.PublishViewControllerKeyConstants.publishLblText
        NotificationCenter.default.addObserver(self, selector: #selector(servicePublished), name: Notification.Name("NotificationPost"), object: nil)
    }
    
    @objc func servicePublished(){
        ServiceProvider.sharedInstance.stopServiceScan()
        statusLbl.text = KeyConstant.PublishViewControllerKeyConstants.scanLblText
    }
    
}

extension PublishViewController:PublishScanProtocol{
    
    func scanBtnClicked() {
        statusLbl.text = KeyConstant.PublishViewControllerKeyConstants.publishLblText
    }
    
    func publishBtnClicked() {
        ServiceProvider.sharedInstance.scanForNetworks()
    }
    
}

