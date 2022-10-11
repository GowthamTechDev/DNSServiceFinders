//
//  PublishViewController.swift
//  DNSServiceFinder
//
//  Created by Kiran on 09/10/22.
//

import UIKit

class PublishViewController: UIViewController {
    
    @IBOutlet weak var statusLbl: UILabel!
    
    //MARK: -ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewController.publishScanProtocol = self
        statusLbl.text = KeyConstant.PublishViewControllerKeyConstants.publishLblText
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
}

extension PublishViewController:PublishScanProtocol{
    
    func scanBtnClicked() {
        statusLbl.text = KeyConstant.PublishViewControllerKeyConstants.scanLblText
    }
    
    func publishBtnClicked() {
        statusLbl.text = KeyConstant.PublishViewControllerKeyConstants.publishLblText
    }
    
}
