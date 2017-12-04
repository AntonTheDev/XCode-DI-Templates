[![Platform](https://img.shields.io/badge/platform-ios%20%7C%20tvos-lightgrey.svg)](https://github.com/AntonTheDev/XCode-DI-Templates/)
[![Join the chat at https://gitter.im/AntonTheDev/XCode-DI-Templates](https://badges.gitter.im/AntonTheDev/XCode-DI-Templates.svg)](https://gitter.im/AntonTheDev/XCode-DI-Templates?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![License](https://img.shields.io/badge/license-MIT-343434.svg)](https://github.com/AntonTheDev/XCode-DI-Templates/)


# Xcode Dependency Injected Templates

An architectural Swinject Infused Xcode Template to use as a starting point for an iOS and tvOS Apps.

### Setup

1. Clone the XCode-DI-Templates Repository into your developer folder
2. Navigate into the cloned repository and run the following command to install the templates.

```
sudo sh install.sh
```

### Instructions

Once the templates are installed, XCode-DI will show up in your default templates when creating a new Xcode project for iOS and tvOS.

![alt tag](/Documentation/1-NewProjectIcon.png?raw=true)

The project contains a pre-configured Cartfile with the all framework imports, build phase scripts, and standard project scaffolding configured.

The scaffolding is as follows:

![alt tag](/Documentation/2-Scaffolding.png?raw=true)


The frameworks have already been added as part of the project, the only step needed to ensure they exist is to download the latest code and build the frameworks. perform the following commands accordingly.

```
/* For iOS */

carthage update --platform ios

/* For tvOS */

carthage update --platform tvos
```

Once all frameworks should be downloaded and built into your project via Carthage.

Libraries included:
* Alamofire (3.3.0)
* AlamofireImage(4.5.1)
* Swinject (2.1.1)
* JSONModelKit (1.0.0)
* FlightAnimator (0.9.9)
* FlightLayout (0.8.1)





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
