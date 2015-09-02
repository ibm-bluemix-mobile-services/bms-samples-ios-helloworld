// Copyright 2015 IBM Corp. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit
import Foundation
class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var pingButton: UIButton!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var errorTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func testBluemixConnection(sender: AnyObject) {
        self.pingButton.backgroundColor=UIColor (red:0.0/255.0, green:174.0/255.0, blue:211.0/255.0, alpha:1)
        
        //Logging is currently set to Info level. You can set the level below based on how much output you want to see:
        let logger = IMFLogger(forName:"helloWorld")
        IMFLogger.setLogLevel(IMFLogLevel.Info)
        logger.logInfoWithMessages("Testing connection to Bluemix")
        
        //Testing the connection to Bluemix by attempting to obatain authorization header from AMA. This test will also ensure the correct Bundle Identifier, Bundle Version, ApplicationRoute and ApplicationID have been set.
        let authManager = IMFAuthorizationManager.sharedInstance()
        authManager.obtainAuthorizationHeaderWithCompletionHandler { (response:IMFResponse!, error:NSError!) -> Void in
        if (error == nil)
        {
            NSLog("You have connected to Bluemix successfully")
            self.topLabel.text = "Yay!"
            self.bottomLabel.text = "You Are Connected"
            self.errorTextView.text = ""
            self.pingButton.backgroundColor=UIColor (red:28.0/255.0, green:178.0/255.0, blue:153.0/255.0, alpha:1)
            
        } else
        {
            NSLog("%@",error);
            self.topLabel.text = "Bummer"
            self.bottomLabel.text = "Something Went Wrong"
            if (!error.localizedDescription.isEmpty){
                var errorMsg =  error.localizedDescription + " Please verify the Bundle Identifier, Bundle Version, ApplicationRoute and ApplicationID"
                self.errorTextView.text = errorMsg
            }
            else{
                 self.errorTextView.text = "Please verify the Bundle Identifier, Bundle Version, ApplicationRoute and ApplicationID"
            }
        }
        self.pingButton.backgroundColor=UIColor (red:28.0/255.0, green:178.0/255.0, blue:153.0/255.0, alpha:1)
        }
        IMFLogger.send()
    }
    }



