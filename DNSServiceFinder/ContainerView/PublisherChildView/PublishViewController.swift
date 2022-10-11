//
//  PublishViewController.swift
//  DNSServiceFinder
//
//  Created by Kiran on 09/10/22.
//

import UIKit

final class PublishViewController: UIViewController {
    
    @IBOutlet weak var statusLbl: UILabel!
    let fetchService = ServiceProvider()
    
    //MARK: -ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.publishScanProtocol = self
        ServiceProvider.servicePublished = self
        self.statusLbl.text = KeyConstant.PublishViewControllerKeyConstants.publishLblText
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

extension PublishViewController:ServicePublished{
    func servicePublished() {
        ServiceProvider.sharedInstance.stopServiceScan()
        statusLbl.text = KeyConstant.PublishViewControllerKeyConstants.scanLblText
    }
}
