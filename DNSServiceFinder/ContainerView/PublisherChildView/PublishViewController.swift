//
//  PublishViewController.swift
//  DNSServiceFinder
//
//  Created by Kiran on 09/10/22.
//

import UIKit

final class PublishViewController: UIViewController {
    
    @IBOutlet weak var statusLbl: UILabel!
    
    //MARK: - ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServiceProvider.sharedInstance.stopServiceScan()
        setDelegate()
        UISetup()
        addObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("NotificationPost"), object: nil)
    }
    
    //MARK: -UI Methods
    
    func setDelegate(){
        ViewController.publishScanProtocol = self
    }
    
    func UISetup(){
        self.statusLbl.text = KeyConstant.PublishViewControllerKeyConstants.publishLblText
    }
    
    func addObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(servicePublished), name: Notification.Name("NotificationPost"), object: nil)
    }
    
    //MARK: - Notification Methods Handler

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
        let uuid = UIDevice.current.identifierForVendor?.uuidString ?? ""
        ServiceProvider.sharedInstance.scanForNetworks(uuid: uuid)
    }
    
}

