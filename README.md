[![Platform](https://img.shields.io/badge/platform-ios%20%7C%20tvos-lightgrey.svg)](https://github.com/AntonTheDev/JSONModelKit/)
[![Join the chat at https://gitter.im/AntonTheDev/XCode-DI-Templates](https://badges.gitter.im/AntonTheDev/XCode-DI-Templates.svg)](https://gitter.im/AntonTheDev/XCode-DI-Templates?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![License](https://img.shields.io/badge/license-MIT-343434.svg)](https://github.com/AntonTheDev/XCode-DI-Templates/)


# Xcode Dependency Injected Templates

This is an architectural Swinject Infused Xcode Template which will be the starting point for an iOS app.

### Setup

1. Clone the XCode-DI-Templates Repository into your developer folder
2. In your project root run the following commands

	```
	sudo sh install.sh
	```

### Instructions

Once the template is installed, XCode-DI will show up in your default templates when creating a new Xcode project.

The project contains a pre-configured cartfile will the all the imports and script build phases configured. After creating the project, and navigate into the root directory, and run the following command:

```
carthage update
```

Once all frameworks should be downloaded and built into your project via carthage.

Libraries included:
* Alamofire
* AlamofireImage
* Swinject
* JSONModelKit
* FlightAnimator
* FlightLayout

File Templates Included:

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
