//
//  ViewController.swift
//  DNSServiceFinder
//
//  Created by Kiran on 09/10/22.
//

import UIKit

protocol PublishScanProtocol:AnyObject{
    func publishBtnClicked()
    func scanBtnClicked()
}

class ViewController: UIViewController {
    
    static weak var publishScanProtocol:PublishScanProtocol?

    @IBOutlet weak var scannerContanierView: UIView!
    @IBOutlet weak var publishContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func publishNetworks(_ sender: Any) {
        ViewController.publishScanProtocol?.publishBtnClicked()
        publishContainerView.alpha = 1
        scannerContanierView.alpha = 0
    }
    
    @IBAction func scanNetworks(_ sender: Any) {
        ViewController.publishScanProtocol?.scanBtnClicked()
        publishContainerView.alpha = 0
        scannerContanierView.alpha = 1
    }
    
}

