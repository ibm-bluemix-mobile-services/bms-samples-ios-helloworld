# HelloWorld application for IBM MobileFirst Services on IBM Bluemix
---
The HelloWorld sample contains Objective-C and Swift projects that you can use to learn.  
### Downloading the samples
Clone the samples from Github with the following command:

git clone https://github.com/ibm-bluemix-mobile-services/bms-samples-ios-helloworld

Select the Swift or Objective-C version of the helloWorld App:

- helloWorld_objective_c

- helloWorld_swift

### Configure the front end in the HelloWorld sample
1. In a terminal, navigate to the bms-samples-ios-helloworld directory where the project was cloned
2. Navigate to the helloWorld_objective_c or helloWorld_swift directory
3. Open the Xcode workspace: `open helloWorld.xcworkspace`.
4. Open the AppDelegate (AppDelegate.m or AppDelegate.swift) and add the corresponding ApplicationRoute and
    ApplicationID in the application didFinishLaunchingWithOptions method:


Objective C:

		(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

		//initialize SDK with IBM Bluemix application ID and route
		//TODO: Please Enter a valid ApplicationRoute for initializaWithBacken Route and a valid ApplicationId for backenGUID
		IMFClient *imfClient = [IMFClient sharedInstance];
		[imfClient initializeWithBackendRoute:@"<APPLICATION_ROUTE>" backendGUID:@"<APPLICATION_ID>"];			
		
		return YES;
		}

Swift:

		func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
			
        //initialize SDK with IBM Bluemix application ID and route
        //TODO: Please Enter a valid ApplicationRoute for initializaWithBackendRoute and a valid ApplicationId for backenGUID
        IMFClient.sharedInstance().initializeWithBackendRoute("<APPLICATION_ROUTE>", backendGUID: "<APPLICATION_ID>")

        return true
    }

		

		
### Run the iOS App
Now you can run your iOS application in your mobile emulator or on your device.

You will see a single view application with a "PING BLUEMIX" button. When you click this button the application will test the connection from the client to the backend Bluemix application. The application uses the ApplicationRoute specified in the AppDelegate in order to test the connection. The application will then display if the connection was successful or unsuccessful. In the unsuccessful state an error will be displayed in the log as well as in the application. 

Note: Inside the ViewController a Get request is made to a protected resource on the Node.js runtime on Bluemix. This code has been provided in the MobileFirst Services Starter boilerplate. If the backend application was not created using the MobileFirst Services Starter boilerplate the application will not be able to connect successfully.



Note: This application has been built to run on the latest version of XCode (7.0) as well as the latest version of Swift (2.0). Also the application has updated to allow "NSAllowsArbitraryLoads" for NSAppTransportSecurity as a workaround for the Application Transport Security settings introduced in iOS 9. For more info please see the following blog:

    [Connect Your iOS 9 App to Bluemix](https://developer.ibm.com/bluemix/2015/09/16/connect-your-ios-9-app-to-bluemix/)

### License
This package contains sample code provided in source code form. The samples are licensed under the under the Apache License, Version 2.0 (the "License"). You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and may also view the license in the license.txt file within this package. Also see the notices.txt file within this package for additional notices.
