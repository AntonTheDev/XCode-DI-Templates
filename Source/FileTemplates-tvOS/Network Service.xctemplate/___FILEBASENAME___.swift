//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation
import Alamofire

/*
    Add the following in the registerDataServices() method of the
    Services class.
 
        dataServicesContainer.register(___FILEBASENAME___.self, name: NetworkQoS.default.rawValue) { r in
            let service = ___FILEBASENAME___(name: NetworkQoS.default.rawValue, qos: .default)
            return service
        }.inObjectScope(.container)
*/


typealias ___FILEBASENAME___Response = (_ response : [String : AnyObject]?, _ error : Error?) -> ()

class ___FILEBASENAME___ {
    
    var queue : DispatchQueue!
    
    required init(name : String, qos: DispatchQoS, headers: HTTPHeaders = HTTPHeaders()) {
        queue = DispatchQueue(label: name, qos: qos)
        httpHeaders = headers
    }
    
    var httpHeaders: HTTPHeaders?
    
    internal func performRequest(request : String,
                                 method : Alamofire.HTTPMethod,
                                 parameters: [String : AnyObject] = [String : AnyObject](),
                                 completion : @escaping ___FILEBASENAME___Response) {
        
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
                           completion : @escaping ___FILEBASENAME___Response) {
        
        performRequest(request: request, method: .get, parameters: parameters, completion: completion)
    }
    
    func performPUTRequest(request : String,
                           parameters: [String : AnyObject] = [String : AnyObject](),
                           completion : @escaping ___FILEBASENAME___Response) {
        
        performRequest(request: request, method: .put, parameters: parameters, completion: completion)
    }
    
    func performPOSTRequest(request : String,
                            parameters: [String : AnyObject] = [String : AnyObject](),
                            completion : @escaping ___FILEBASENAME___Response) {
        
        performRequest(request: request, method: .post, parameters: parameters, completion: completion)
    }
    
    func performPATCHRequest(request : String,
                             parameters: [String : AnyObject] = [String : AnyObject](),
                             completion : @escaping ___FILEBASENAME___Response) {
        
        performRequest(request: request, method: .patch, parameters: parameters, completion: completion)
    }
    
    func performDELETERequest(request : String,
                              parameters: [String : AnyObject] = [String : AnyObject](),
                              completion : @escaping ___FILEBASENAME___Response) {
        
        performRequest(request: request, method: .delete, parameters: parameters, completion: completion)
    }
}
