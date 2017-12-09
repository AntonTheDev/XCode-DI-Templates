//
//  NetworkingService.swift
//  TestProject21
//
//  Created by Anton on 12/8/17.
//Copyright © 2017 Anton Doudarev. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkQoS : String  {
    case background         = ".background"
    case utility            = ".utility"
    case `default`          = ".default"
    case userInitiated      = ".userInitiated"
    case userInteractive    = ".userInteractive"
}

typealias NetworkingServiceResponse = (_ response : [String : AnyObject]?, _ error : Error?) -> ()

class NetworkingService {
    
    var queue : DispatchQueue!
    
    required init(name : String, qos: DispatchQoS, headers: HTTPHeaders = HTTPHeaders()) {
        queue = DispatchQueue(label: name, qos: qos)
        httpHeaders = headers
    }
    
    var httpHeaders: HTTPHeaders?
    
    internal func performRequest(request : String,
                                 method : Alamofire.HTTPMethod,
                                 parameters: [String : AnyObject] = [String : AnyObject](),
                                 completion : @escaping NetworkingServiceResponse) {
        
        Alamofire.request(request,
                          method: method,
                          parameters: parameters,
                          headers: httpHeaders).validate().responseJSON(queue: queue) { response in
                            
                            switch response.result {
                            case .success:
                                if let JSONResponse = response.result.value as? [String : AnyObject] {
                                    completion(JSONResponse, nil)
                                }
                            case .failure(let error):
                                completion(nil, error)
                            }
        }
    }
    
    func performGETRequest(request : String,
                           parameters: [String : AnyObject] = [String : AnyObject](),
                           completion : @escaping NetworkingServiceResponse) {
        
        performRequest(request: request, method: .get, parameters: parameters, completion: completion)
    }
    
    func performPUTRequest(request : String,
                           parameters: [String : AnyObject] = [String : AnyObject](),
                           completion : @escaping NetworkingServiceResponse) {
        
        performRequest(request: request, method: .put, parameters: parameters, completion: completion)
    }
    
    func performPOSTRequest(request : String,
                            parameters: [String : AnyObject] = [String : AnyObject](),
                            completion : @escaping NetworkingServiceResponse) {
        
        performRequest(request: request, method: .post, parameters: parameters, completion: completion)
    }
    
    func performPATCHRequest(request : String,
                             parameters: [String : AnyObject] = [String : AnyObject](),
                             completion : @escaping NetworkingServiceResponse) {
        
        performRequest(request: request, method: .patch, parameters: parameters, completion: completion)
    }
    
    func performDELETERequest(request : String,
                              parameters: [String : AnyObject] = [String : AnyObject](),
                              completion : @escaping NetworkingServiceResponse) {
        
        performRequest(request: request, method: .delete, parameters: parameters, completion: completion)
    }
}
