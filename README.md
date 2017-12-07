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
<img align="center"  src="/Documentation/1-NewProjectIcon.png?raw=true" width="600" height="430" />
</p>

#### Bootstrap New Project

The project contains a pre-configured Cartfile with the all framework imports, build phase scripts, and standard project scaffolding configured. In the root directory of your project, run the following command to install the frameworks included as part of the template.

```
/* For iOS */

carthage update --platform ios

/* For tvOS */

carthage update --platform tvos
```

The new project is configured with the following frameworks, as reflected by the scaffolding:
<p align="center">
<table width="50%" height="342">
<td><p align="center">
<img align="center"  src="/Documentation/2-Framework-Includes.png?raw=true" width="226" height="342" />
</p></td>

<td>
<p align="center">

* Alamofire (3.3.0)
* AlamofireImage(4.5.1)
* Swinject (2.1.1)
* JSONModelKit (1.0.0)
* FlightAnimator (0.9.9)
* FlightLayout (0.8.1)
</p>

</td>
</table>
</p>

<br/>

<p align="center">
<img align="center"  src="/Documentation/2-Framework-Includes.png?raw=true" width="226" height="342" />
</p>

The last step is to download them via Carthage and have them built. In the root directory of your project, run the following command.


### Scaffolding Explained





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
