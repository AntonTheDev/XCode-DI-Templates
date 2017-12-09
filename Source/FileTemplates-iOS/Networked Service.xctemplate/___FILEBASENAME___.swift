//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation
import UIKit

/**
 *
 *    Move the following Service definition to ServiceDefinition file.
 *
 **/

protocol ___VARIABLE_moduleName___Type : class {
    
    var networkingService : NetworkService? { get set }
    
    // Define Methods Here
}

/*
    Add the following in the registerDataServices() method of the
    Services class.
 
        dataServicesContainer.register(___VARIABLE_moduleName___Type.self) { r in

            let service = ___VARIABLE_moduleName___()
            
            // Adjust the QoS as needed for this service
            
            service.networkingService = r.resolve(NetworkService.self, name: NetworkQoS.default.rawValue)
            return service

        }.inObjectScope(.container)
*/


class ___VARIABLE_moduleName___ : ___VARIABLE_moduleName___Type {
    
    var networkingService : NetworkService?
}
