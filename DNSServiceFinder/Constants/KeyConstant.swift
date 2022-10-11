//
//  KeyConstant.swift
//  DNSServiceFinder
//
//  Created by Kiran on 09/10/22.
//

import Foundation

struct KeyConstant{
    
    struct PublishViewControllerKeyConstants{
        static let publishLblText = "Click Publish and Click Scan!!"
        static let scanLblText    = "Click Scan Now!!!"
    }
    
    struct MDNSModelKeyConstant{
        static let domainName:String = "local."
        static let serviceType:String = "_http._tcp."
        static let port:Int32 = 80
    }
    
    struct ScanViewControllerKeyConstants{
        
    }
    
    struct CellIdentifiersName{
        static let scanTableViewCellID = "ScanTableViewCell"
    }
    
    struct CellReuseIdentifiers{
        static let scanTableViewCellReuseIdentifier = "ScanTableViewCell"
    }
    
}
