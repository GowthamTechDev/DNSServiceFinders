//
//  PublishViewController.swift
//  DNSServiceFinder
//
//  Created by Kiran on 09/10/22.
//

import UIKit

class PublishViewController: UIViewController {

    @IBOutlet weak var statusLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLbl.text = "Publish and scan and network"
    }
    
}
