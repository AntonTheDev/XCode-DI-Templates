Welcome to the XCode-DI-Templates wiki!

[![Platform](https://img.shields.io/badge/platform-ios%20%7C%20tvos-lightgrey.svg)](https://github.com/AntonTheDev/XCode-DI-Templates/)
[![Join the chat at https://gitter.im/AntonTheDev/XCode-DI-Templates](https://badges.gitter.im/AntonTheDev/XCode-DI-Templates.svg)](https://gitter.im/AntonTheDev/XCode-DI-Templates?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![License](https://img.shields.io/badge/license-MIT-343434.svg)](https://github.com/AntonTheDev/XCode-DI-Templates/)


# Xcode Dependency Injected Templates

An architectural Swinject Infused Xcode Template to use as a starting point for an iOS and tvOS Apps.

## Installation

1. Clone the XCode-DI-Templates Repository into your developer folder
2. Navigate into the cloned repository and run the following command to install the templates.

```
sudo sh install.sh
```

## Create Project

Once the templates are installed, XCode-DI will show up in your default templates when creating a new Xcode project for iOS and tvOS.

<p align="center">
<img align="center"  src="https://github.com/AntonTheDev/XCode-DI-Templates/blob/master/Documentation/1-NewProjectIcon.png?raw=true" width="600" height="430" />
</p>

## Bootstrap Frameworks

The project contains a pre-configured Cartfile with the all framework imports, build phase scripts, and standard project scaffolding configured as reflected by the scaffolding:

<table align="center">
  <tr>
    <td width="400" height="400" align="center">
<img align="center"  src="https://github.com/AntonTheDev/XCode-DI-Templates/blob/master/Documentation/2-Framework-Includes.png?raw=true" width="226" height="342" />
    </td>
    <td width="400">

* Alamofire (3.3.0)
* AlamofireImage(4.5.1)
* Swinject (2.1.1)
* JSONModelKit (1.0.0)
* FlightAnimator (0.9.9)
* FlightLayout (0.8.1)

    </td>
  </tr>
</table>

The last step is to download them via Carthage and have them built. In the root directory of your project, run the following command in the root directory of your project.


```
/* For iOS */

carthage update --platform ios

/* For tvOS */

carthage update --platform tvos
```


## Create Service

If familiar with Swinject, this should really expedite development for you, otherwise please read the Swinject documentation [here](https://github.com/Swinject/Swinject) to familiarize yourself with this dependency injection framework.

The project template, under the services group you will see two files, **ServicesDefinitions.swift**, and **Services.swift**. The **Services.swift** class is the shared container that is injected accordingly into the the newly defined Services, and ViewControllers, from the templates provided as part of this repo.

```swift
import UIKit
import Swinject

class Services {

    var dataServicesContainer = Container()
    var viewControllerContainer = Container()

    init() {
        registerServices()
        registerViewControllers()
    }

    func registerServices() {

    }

    func registerViewControllers() {

        viewControllerContainer.register(BaseViewController.self) {
             _ in BaseViewController(container: self.viewControllerContainer)
        }.initCompleted { (r, controller) in

        }
    }
}
```

Now lets define a new **Service** from the templates, to see what it generates. For the purpose of this example, lets assume it's a service that will keep track of our account, for whichever app we chose to develop.

Click on File > New > File... and selected the Service Template.

<p align="center">
<img align="center"  src="https://github.com/AntonTheDev/XCode-DI-Templates/blob/master/Documentation/3-New-Service.png?raw=true" width="600" height="430" />
</p>

Two new files will be generated, **AccountService.swift**, and **TestAccountService.swift**, one for production purposes, and one for test purposes. But First let's observe the **AccountService.swift** file below to see has been included within.

```swift
import Foundation
import UIKit

/**
 *
 *    Move the following Service definition to ServiceDefinition file.
 *
 **/

protocol AccountServiceType : class {

    // Define Methods Here
}

/*
    Add the following in the registerDataServices() method of the
    Services class.

        dataServicesContainer.register(AccountServiceType.self) { r in

            let service = AccountService()
            return service

        }.inObjectScope(.container)
*/

class AccountService : AccountServiceType {

}
```

The first thing you will notice are all the comments within the file generated. These commented out blocks are intended to expedite service definitions by providing a protocol definition to be added to **ServicesDefinitions.swift**, and a Swinject definition to be included in the **Services.swift** file. After performing the copy and paste of the commented blocks the end product should look like this.

**ServiceDefinitions.swift**
```swift

protocol AccountServiceType : class {

}
```

**Services.swift**
```swift

class Services {

    var dataServicesContainer = Container()
    var viewControllerContainer = Container()

    init() {
        registerServices()
        registerViewControllers()
    }

    func registerServices() {

        dataServicesContainer.register(AccountServiceType.self) { r in

            let service = AccountService()
            return service

        }.inObjectScope(.container)
    }

    func registerViewControllers() {

        viewControllerContainer.register(BaseViewController.self) {
             _ in BaseViewController(container: self.viewControllerContainer)
        }.initCompleted { (r, controller) in

        }
    }
}

```

**AccountService.swift**
```swift
class AccountService : AccountServiceType {

}
```

**TestAccountService.swift**
```swift
class TestAccountService : AccountServiceType {

}
```

### Included Service Templates

* **Service**
	* Service Class
	* Test Service Class
	* Pre-Configured with abstract protocol

* **Data Service**
	* Service Class
	* Test Service Class
	* Networked Service
	* Pre-Configured with abstract protocols

* **Network Service**
	* Networking Service
	* Pre configured with Alamofire out of the box



## Other Included Templates

* **ViewController**
	* Extends BaseViewController included in the DI Template
	* Pre-Configured method overrides


* **View**
	* Extends BaseView included in the DI Template
	* Pre-Configured method overrides


* **Collection ViewController**
	* Extends BaseViewController included in the DI Template
	* Bootstraps CollectionView Delegate/DataSource methods


* **CollectionViewCell**
	* Extends BaseCollectionViewCell included in the DI Template
	* Pre-Configured method overrides


* **Service**
	* Service Class
	* Test Service Class
	* Pre-Configured with abstract protocol

* **Data Service**
	* Service Class
	* Test Service Class
	* Networked Service
	* Pre-Configured with abstract protocols

* **Network Service**
	* Networking Service
	* Pre configured with Alamofire out of the box

* **Transitioning Container ViewController**
	* Container ViewController
	* Pre-Configured for UIViewControllerAnimatedTransitioning


* **Transitioning Animator**
	* Pre-Configured UIViewControllerAnimatedTransitioning instance


* **Video ViewController**
	* Extends BaseViewController included in the DI Template
	* Pre-Configured to play single video file
