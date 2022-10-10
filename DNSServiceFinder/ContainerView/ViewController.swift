//
//  ViewController.swift
//  DNSServiceFinder
//
//  Created by Kiran on 09/10/22.
//

import UIKit

protocol PublishProtocolClicked:AnyObject{
    func publishBtnClicked()
}

class ViewController: UIViewController {
    
    static var publishClicked:PublishProtocolClicked?
    @IBOutlet weak var scannerContanierView: UIView!
    @IBOutlet weak var publishContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func publishNetworks(_ sender: Any) {
        ViewController.publishClicked?.publishBtnClicked()
        publishContainerView.alpha = 1
        scannerContanierView.alpha = 0
        
    }
    
    @IBAction func scanNetworks(_ sender: Any) {
        publishContainerView.alpha = 0
        scannerContanierView.alpha = 1
    }
    
}

