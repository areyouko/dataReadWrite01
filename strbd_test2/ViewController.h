//
//  ViewController.h
//  strbd_test2
//
//  Created by JD Park on 2015. 4. 21..
//  Copyright (c) 2015년 JD Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *hName;
@property (weak, nonatomic) IBOutlet UITextField *dName;
@property (weak, nonatomic) IBOutlet UITextField *uName;


- (IBAction)okClicked:(id)sender;

@end

