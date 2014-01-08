//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Nikhila Srikanth on 1/2/14.
//  Copyright (c) 2014 Yahoo! Inc. All rights reserved.
//

#import "SettingsViewController.h"

NSString * stringValue;

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *defaultTipTextBox;

- (IBAction)SettingsTap:(id)sender;
- (void)enterDefaultPercentage;

@end


@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //NSString *stringValue = [defaults objectForKey:@"default_percent"];
    stringValue = [defaults objectForKey:@"default_percent"];
    self.defaultTipTextBox.text = stringValue;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
- (IBAction)editStart:(id)sender {
    self.defaultTipTextBox.text = @"";
}

- (IBAction)SettingsTap:(id)sender {
    [self.view endEditing:YES];
    [self enterDefaultPercentage];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //NSString *stringValue = [defaults objectForKey:@"default_percent"];
    stringValue = [defaults objectForKey:@"default_percent"];
    self.defaultTipTextBox.text = stringValue;
    
}

-(void)enterDefaultPercentage {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.defaultTipTextBox.text forKey:@"default_percent"];
    //[defaults setInteger:123 forKey:@"another_key_that_you_choose"];
    [defaults synchronize];
}
@end
