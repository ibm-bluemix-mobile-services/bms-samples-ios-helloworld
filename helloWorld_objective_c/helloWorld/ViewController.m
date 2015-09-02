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
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
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

    _pingButton.backgroundColor =[UIColor colorWithRed:0.0/255.0 green:174.0/255.0 blue:211.0/255.0 alpha:1];
    
    //Logging is currently set to Info level. You can set the level below based on how much output you want to see:
    IMFLogger *logger=[IMFLogger loggerForName:@"helloWorld"];
    [IMFLogger setLogLevel:IMFLogLevelInfo];
    [logger logInfoWithMessages:@"Testing connection to Bluemix"];
  
    
    //Testing the connection to Bluemix by attempting to obatain authorization header from AMA. This test will also ensure the correct Bundle Identifier, Bundle Version, ApplicationRoute and ApplicationID have been set.
    IMFAuthorizationManager *authManager = [IMFAuthorizationManager sharedInstance];
    [authManager obtainAuthorizationHeaderWithCompletionHandler:^(IMFResponse *response, NSError *error) {
        if (error==nil)
        {
            NSLog(@"You have connected to Bluemix successfully");
            _topLabel.text = @"Yay!";
            _bottomLabel.text = @"You Are Connected";
            _errorTextView.text = @"";
            
        } else
        {
            NSLog(@"%@",error);
            _topLabel.text = @"Bummer";
            _bottomLabel.text = @"Something Went Wrong";
            if (error.localizedDescription!=nil){
                NSString *errorMsg =  [NSString stringWithFormat: @"%@ Please verify the Bundle Identifier, Bundle Version, ApplicationRoute and ApplicationID.", error.localizedDescription];
                _errorTextView.text = errorMsg;
            }
        }
        _pingButton.backgroundColor=[UIColor colorWithRed:28.0/255.0 green:178.0/255.0 blue:153.0/255.0 alpha:1];

     }];
    [IMFLogger send];
}
@end
