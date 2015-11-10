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
        
        //Testing the connection to Bluemix by sending a Get request to  the Node.js application. This Node.js piece was provided in the MobileFirst Services Starter boilerplate. The below request uses the applicationRoute that was provided when initializing the IMFClient in the AppDelegate.
        
        let imfClient = IMFClient.sharedInstance()
        let request = IMFResourceRequest(path: imfClient.backendRoute)
        request.setHTTPMethod("GET")
        request.sendWithCompletionHandler { (response, error ) -> Void in
            
            if error != nil {
                NSLog("%@",error);
                self.topLabel.text = "Bummer"
                self.bottomLabel.text = "Something Went Wrong"
                if (!error.localizedDescription.isEmpty){
                    let errorMsg =  error.localizedDescription + " Please verify the ApplicationRoute and ApplicationID"
                    self.errorTextView.text = errorMsg
                }
                else{
                    self.errorTextView.text = "Please verify the ApplicationRoute and ApplicationID"
                }

            }
            else {
                NSLog("You have connected to Bluemix successfully")
                self.topLabel.text = "Yay!"
                self.bottomLabel.text = "You Are Connected"
                self.errorTextView.text = ""
            }
                   }
        
            }
    }



