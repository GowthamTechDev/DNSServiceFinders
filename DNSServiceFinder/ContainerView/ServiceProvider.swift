//
//  ServiceProvider.swift
//  DNSServiceFinder
//
//  Created by Kiran on 11/10/22.
//

import Foundation

class ServiceProvider:NSObject{
    
    static var sharedInstance = ServiceProvider()
    var netService: NetService?
    var services = [NetService]()
    
    override init() {
        super.init()
    }
    
    func scanForNetworks(uuid:String){
        let dnsDomain = KeyConstant.MDNSModelKeyConstant.self
        netService = NetService(domain: dnsDomain.domainName, type: dnsDomain.serviceType, name: uuid, port: dnsDomain.port)
        netService?.delegate = self
        netService?.publish(options: [.listenForConnections])
    }
    
    func stopServiceScan(){
        netService?.stop()
        netService = nil
    }
    
}

extension ServiceProvider:NetServiceDelegate{
    
    func netServiceWillPublish(_ sender: NetService) {
        handleDuplicateElements(service: sender)
        NotificationCenter.default.post(name: Notification.Name("NotificationPost"), object: nil)
    }
    
    func handleDuplicateElements(service:NetService){
        if ServiceProvider.sharedInstance.services.isEmpty{
            ServiceProvider.sharedInstance.services.append(service)
        }else{
            for service in ServiceProvider.sharedInstance.services{
                if service == service{
                    print("Service already exist")
                }else{
                    ServiceProvider.sharedInstance.services.append(service)
                }
            }
        }
    }
    
    /*UnComment Delegate Methods If required
     
     func netServiceDidResolveAddress(_ sender: NetService) {}
     
     func netServiceWillResolve(_ sender: NetService) { }
     
     func netServiceDidPublish(_ sender: NetService) {}
     
     func netService(_ sender: NetService, didNotPublish errorDict: [String : NSNumber]) {}
     
     func netService(_ sender: NetService, didAcceptConnectionWith inputStream: InputStream, outputStream: OutputStream) {}
     
     func netServiceDidStop(_ sender: NetService) {}
     
     */
    
}
