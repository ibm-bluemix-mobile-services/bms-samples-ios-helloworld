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

#import "ViewController.h"
#import <IMFCore/IMFCore.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UIButton *pingButton;
@property (weak, nonatomic) IBOutlet UITextView *errorTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)testBluemixConnection:(id)sender{

    ///Testing the connection to Bluemix by sending a Get request to the Node.js application. This Node.js piece was provided in the MobileFirst Services Starter boilerplate. The below request uses the applicationRoute that was provided when initializing the IMFClient in the AppDelegate.
    IMFClient *imfClient = [IMFClient sharedInstance];
    NSString *backendURL = [NSString stringWithFormat:@"%@",imfClient.backendRoute];
    IMFResourceRequest* request = [IMFResourceRequest requestWithPath:backendURL];
    [request setHTTPMethod:@"GET"];
    [request sendWithCompletionHandler:^(IMFResponse *response, NSError *error) {
        
        if (error != nil) {
            NSLog(@"%@",error);
            _topLabel.text = @"Bummer";
            _bottomLabel.text = @"Something Went Wrong";
            if (error.localizedDescription!=nil){
                NSString *errorMsg =  [NSString stringWithFormat: @"%@ Please verify the ApplicationRoute and ApplicationID.", error.localizedDescription];
                _errorTextView.text = errorMsg;
            }
            
        } else {
            NSLog(@"You have connected to Bluemix successfully");
            _topLabel.text = @"Yay!";
            _bottomLabel.text = @"You Are Connected";
            _errorTextView.text = @"";
            
            }
    }];
    }
@end
