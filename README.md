[![Platform](https://img.shields.io/badge/platform-ios%20%7C%20tvos-lightgrey.svg)](https://github.com/AntonTheDev/XCode-DI-Templates/)
[![Join the chat at https://gitter.im/AntonTheDev/XCode-DI-Templates](https://badges.gitter.im/AntonTheDev/XCode-DI-Templates.svg)](https://gitter.im/AntonTheDev/XCode-DI-Templates?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![License](https://img.shields.io/badge/license-MIT-343434.svg)](https://github.com/AntonTheDev/XCode-DI-Templates/)

# Xcode-DI

An architectural Swinject Infused XCode Template to use as a starting point for an iOS, and tvOS apps.

# Introduction

From building a prototype, to a full blown production app, a lack of resources, or leading a big team, XCode-DI was developed with a goal to streamline development, reduce development, and ensure the long term flexibility of the project from prototype to production.

Over the years developing, my approach to the development has drastically changed, but one thing hasn't, the project lead always needs to be aware of the architecture, configure the environment as such, and ensure the application's architecture can evolve over time.


# Features

XCode-DI provides a solid starting point for a new project by providing some up front environment configuration such as:

* Configured Project Scaffolding
* Default Frameworks, via Carthage
* Multi-Environment Project Configurations
* Services Container for Swinject
* Networking Layer via Alamofire
* UI BaseLayer w/ Default Workflow, inherited by templates
* XCode Snippets with Auto-Completion of lazy views
* Included Extensions:
    * Photoshop Values -> NSAttributedString
    * Hex Values -> UIColor
    * UIView Geometry

<br />

XCode-DI also makes it easy extend on the project structure by providing some file templates that the base layer making it easy to integrate into the architecture w/ some guided comments as needed.

* Base Layer - ViewController & View.
* Services Layer -  Networked & Standalone
* Collection View -  ViewController & Cell
* Video Player - Video File Playback Controller
* Custom Transitioning -  Container VC,Context, & Animator
* Video Player Controller, Pre-configured
* Many more to come ...

# Installation

1. Clone the XCode-DI-Templates Repository into your developer folder
2. Navigate into the cloned repository and run the following command to install the templates.

```
sudo sh install.sh
```

Once the install script finishes, Xcode should now contain the Xcode-DI template in as a default when creating a new project for iOS, or tvOS.

<p align="center">
<img align="center"  src="https://github.com/AntonTheDev/XCode-DI-Templates/blob/master/Documentation/1-NewProjectIcon.png?raw=true" width="50%" height="50%" />
</p>

# Create Project

It's as simple as selecting the XCode-DI template, and following the usual process in creating a new project. Once created, the project will generate a pre-configured scaffolding as follows.

<p align="center">
<img align="center" src="./Documentation/1-Default-Scaffolding.png?raw=true" width="30%" height="30%" />
</p>

After the project has been created, the first step is to download, and install, the latest frameworks by navigating to the project's root directory, and running the following command:

```
// iOS
carthage update --platform ios

// tvOS
carthage update --platform tvos
```

The last step to perform is to build (⌘B) the project in Xcode, with an expected failure on the first try, and a successful one on the next.

# Documentation

The XCode-DI template is driven by the scaffolding that is pre-generated out of the box. Below is a quick over view of what the upcoming sections will contain as part of the documentation.

* Frameworks - 3rd party libraries, and Cartfile
* Application - AppDelegate, and Application Level Configs
* Extension - Some friendly design level helpers
* Model - Automatically generation model using JSOMModelKit
* ViewModel -  ViewModel definitions / implementations
* UI - Base Swinject Injected UIKit Layer
* Services -  Service Definitions, and Shared Service Container
* Supporting Files -  Assets, Fonts, Storyboards, etc.

Now that we have an sense for the scope of the scaffolding, let's begin by looking a each group one at a time.

## Frameworks

In the frameworks group includes Cartfile used by the project. When adding new frameworks, remember to update the build time script in the project's build target to include it :)

<p align="center">
<img align="center"  src="./Documentation/2-Default Frameworks.png?raw=true" width="30%" height="30%"/>
</p>

The following frameworks are installed accordingly:

* Alamofire (3.3.0)
* AlamofireImage(3.5.1)
* Swinject (2.1.1)
* JSONModelKit (1.0.0)
* FlightAnimator (0.9.9)
* FlightLayout (0.8.1)

## Application

More Documentation Coming Soon....

## Model

Included as part of the project template is JSONModelKit which an API centric mapping framework that uses, a JSON or Plist, mapping files to define a model against an arbitrary dictionary. At build time, the library will generate the model files based on the definitions, and add them to the project automatically, or update any existing files.

By reducing the focus on the model layer itself, and keeping it continuously in sync with an API response in a single place, we can now treat the model as just a "data bucket", and extend it as needed. It comes really handy when implementing MVVM as part of a project's architecture, as it basically reduces the model(s) to ingestible wrapper(s) around dictionary data and nothing more.

## ViewModel

More Documentation Coming Soon....

## Services

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
<img align="center"  src="/Documentation/file_templates.png?raw=true" width="50%" height="50%" />
</p>

**AccountService.swift** will be generated, with an implementation and **TestAccountService.swift**, one for production purposes, and one for test purposes. But First let's observe the **AccountService.swift** file below to see has been included within.

```swift
import Foundation
import UIKit

/**
 *   Move the following Service definition to ServiceDefinition file.
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

    /* Define FileType Methods for production */
}

class TestAccountService : AccountServiceType {

    /* Define FileType Methods for testing */
}
```

The first thing you will notice are all the comments within the file generated. These commented out blocks are intended to expedite service definitions by providing a protocol definition to be added to **ServicesDefinitions.swift**, and a Swinject definition to be included in the **Services.swift** file. After performing the copy and paste of the commented blocks the end product should look like this.


```swift
// ServiceDefinitions.swift

protocol AccountServiceType : class {

}
```

```swift
// Services.swift

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

```swift
// AccountService.swift

class AccountService : AccountServiceType {

}

// TestAccountService.swift

class TestAccountService : AccountServiceType {

}
```

### Included Service Templates

* **Service**
    * ServiceType, Service and Test Service Implementation
    * Pre-Defined against, abstract ServiceType Definition
* **Networked Service**
    * ServiceType, Service and Test Service Implementation
    * Pre-Defined against, abstract ServiceType Definition
    * Pre-Injected with Networking Service
* **Network Service**
	* Pre-Defined Networking Service Implementing Alamofire

## User Interface

More Documentation Coming Soon, here are some templates to checkout in the mean time...

* **ViewController**
    * Extends BaseViewController included in the DI Template
    * Pre-Configured method overrides
* **View**
    * Extends BaseView included in the DI Template
    * Pre-Configured method overrides
* **Collection ViewController**
    * Extends BaseViewController included in the DI Template
    * Bootstraps CollectionView Delegate / DataSource methods
* **CollectionViewCell**
    * Extends BaseCollectionViewCell included in the DI Template
    * Pre-Configured method overrides
* **Transitioning Container ViewController**
    * Container View Controller
    * Pre-Configured for UIViewControllerAnimatedTransitioning
* **Transitioning Animator**
    * Pre-Configured UIViewControllerAnimatedTransitioning instance
* **Video ViewController**
    * Extends BaseViewController included in the DI Template
    * Pre-Configured to play single video file
* **Vertical Paging Flow Layout (iOS only)**
	* Vertically Paging Flow Layout
	* Supports Multiple Sections
* **Horizontal Paging Flow Layout (iOS only)**
	* Horizontally Paging Flow Layout
	* Supports Multiple Sections
