//
//  ServiceProvider.swift
//  DNSServiceFinder
//
//  Created by Kiran on 11/10/22.
//

import Foundation

protocol ServicePublished{
    func servicePublished()
}

class ServiceProvider:NSObject{
    static var sharedInstance = ServiceProvider()
    var netService: NetService!
    var services = [NetService]()
    static var servicePublished:ServicePublished?
    
    override init() {
        super.init()
    }
    
    func scanForNetworks(){
        netService = NetService(domain: "local.", type: "_http._tcp.", name: "My iPhone", port: 80)
        netService.delegate = self
        netService.publish(options: [.listenForConnections])
    }
    
    func stopServiceScan(){
        netService.stop()
        netService = nil
    }
    
}

extension ServiceProvider:NetServiceDelegate{
    
    func netServiceWillPublish(_ sender: NetService) {
        ServiceProvider.servicePublished?.servicePublished()
        ServiceProvider.sharedInstance.services.append(sender)
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