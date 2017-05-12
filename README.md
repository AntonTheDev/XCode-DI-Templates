#XCode-Flight-iOS Templates
=============

This is an architectural Xcode Template which will be the starting point for an iOS.

##Setup

1. Clone the XCode-Flight-iOS Repository into your developer folder
2. In your project root run the following commands

	```
	sudo sh install.sh
	```

##Instructions

Once the template is installed, XCode-Flight will show up in your default templates when creating a new xcode project and prepares a full podfile for configuration

After creating the project, close it, and navigate into the root directory, and run the following command:

```
carthage update
```

Once all frameworks should be downloaded and built into your project via carthage.
