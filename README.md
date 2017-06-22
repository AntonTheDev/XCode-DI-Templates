# XCode-DI-Templates

This is an architectural Swinject Infused Xcode Template which will be the starting point for an iOS app.

### Setup

1. Clone the XCode-DI-Templates Repository into your developer folder
2. In your project root run the following commands

	```
	sudo sh install.sh
	```

### Instructions

Once the template is installed, XCode-DI will show up in your default templates when creating a new xcode project and prepares a full cartfile for configuration

After creating the project, close it, and navigate into the root directory, and run the following command:

```
carthage update
```

Once all frameworks should be downloaded and built into your project via carthage.

Libraries included:
* Alamofire
* Swinject
* JSONModelKit
* FlightAnimator
* FlifgtLayout

Templates Included:
.....
