# iOS helloWorld application for IBM MobileFirst Services on IBM Bluemix
---
This helloWorld sample contains Objective-C and Swift projects that you can use to learn more about Bluemix Mobile Services.

Sections covered to use the helloPush sample for Objective-C:

1. [Downloading the helloWorld sample](#downloading-the-helloworld-sample)
2. [Configuring the back end for your helloWorld application](#configuring-the-back-end-for-your-helloworld-application)
3. [Configuring the front end in the helloWorld sample](#configuring-the-front-end-in-the-helloworld-sample)
4. [Running the iOS app](#running-the-ios-app)
 
### Before you begin
Before you start, make sure you have the following:

- A [Bluemix](http://bluemix.net) account.

### Downloading the helloWorld sample
Clone the sample from Github with the following command:

git clone https://github.com/ibm-bluemix-mobile-services/bms-samples-ios-helloworld

Select the Swift or Objective-C version of the helloWorld App:

- helloWorld_objective_c

- helloWorld_swift

### Configuring the back end for your helloWorld application
Before you can run the helloWorld application, you must set up an app on Bluemix.  The following procedure shows you how to create a MobileFirst Services Starter application. A Node.js runtime environment is created so that you can provide server-side functions, such as resource URIs and static files. The Cloudant®NoSQL DB, IBM Push Notifications, and Mobile Client Access services are then added to the app.

Create a mobile backend in the  Bluemix dashboard:

1.	In the Boilerplates section of the Bluemix catalog, click MobileFirst Services Starter.
2.	Enter a name and host for your mobile backend and click Create.
3.	Click **Finish**.

### Configuring the front end in the HelloWorld sample
1. In a terminal, navigate to the bms-samples-ios-helloworld directory where the project was cloned
2. Navigate to the helloWorld_objective_c or helloWorld_swift directory
3. Open the Xcode workspace: `open helloWorld.xcworkspace`.
4. Open the **AppDelegate** (**AppDelegate.m** or **AppDelegate.swift**) and add the corresponding **ApplicationRoute** and
    **ApplicationID** in the application **didFinishLaunchingWithOptions** method:


Objective C:
```objective-c
		(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

		//initialize SDK with IBM Bluemix application ID and route
		//TODO: Please Enter a valid ApplicationRoute for initializaWithBacken Route and a valid ApplicationId for backenGUID
		IMFClient *imfClient = [IMFClient sharedInstance];
		[imfClient initializeWithBackendRoute:@"<APPLICATION_ROUTE>" backendGUID:@"<APPLICATION_ID>"];			
		
		return YES;
		}
```

Swift:
```objective-c
		func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
			
        //initialize SDK with IBM Bluemix application ID and route
        //TODO: Please Enter a valid ApplicationRoute for initializaWithBackendRoute and a valid ApplicationId for backenGUID
        IMFClient.sharedInstance().initializeWithBackendRoute("<APPLICATION_ROUTE>", backendGUID: "<APPLICATION_ID>")

        return true
    }
```
		

		
### Running the iOS App
Now you can run your iOS application in your mobile emulator or on your device.

You will see a single view application with a "PING BLUEMIX" button. When you click this button the application will test the connection from the client to the backend Bluemix application. The application uses the ApplicationRoute specified in the AppDelegate in order to test the connection. The application will then display if the connection was successful or unsuccessful. In the unsuccessful state an error will be displayed in the log as well as in the application. 

Note: Inside the ViewController a Get request to the Node.js runtime on Bluemix. This code has been provided in the MobileFirst Services Starter boilerplate.


Note: This application has been built to run on the latest version of XCode (7.0) as well as the latest version of Swift (2.0). Also the application has updated to allow "NSAllowsArbitraryLoads" for NSAppTransportSecurity as a workaround for the Application Transport Security settings introduced in iOS 9. For more info please see the following blog:

[Connect Your iOS 9 App to Bluemix](https://developer.ibm.com/bluemix/2015/09/16/connect-your-ios-9-app-to-bluemix/)

### License
This package contains sample code provided in source code form. The samples are licensed under the under the Apache License, Version 2.0 (the "License"). You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and may also view the license in the license.txt file within this package. Also see the notices.txt file within this package for additional notices.
