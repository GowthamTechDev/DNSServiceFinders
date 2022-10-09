//
//  ViewController.swift
//  DNSServiceFinder
//
//  Created by Kiran on 09/10/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scannerContanierView: UIView!
    @IBOutlet weak var publishContainerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func publishNetworks(_ sender: Any) {
        publishContainerView.alpha = 1
        scannerContanierView.alpha = 0
        
    }
    
    @IBAction func scanNetworks(_ sender: Any) {
        publishContainerView.alpha = 0
        scannerContanierView.alpha = 1
    }
    
}

