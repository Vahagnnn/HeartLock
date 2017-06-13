//
//  LockViewController.m
//  HeartLock
//
//  Created by new on 17.04.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import "LockViewController.h"
#import "LockViewModel.h"

@interface LockViewController ()

@property (strong, nonatomic) LockViewModel *lockModel;
@property (weak, nonatomic) IBOutlet UILabel *installationLabel;
@property (weak, nonatomic) IBOutlet UILabel *instalation_Label;
@property (weak, nonatomic) IBOutlet UIView *buttonView;
@property (weak, nonatomic) IBOutlet UIButton *setPassword;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property BOOL buttonSHow;


@end

@implementation LockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cancelButton.hidden = YES;
    self.setPassword.hidden = YES;
    self.buttonView.hidden = YES;
    self.lockModel = [[LockViewModel alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    self.lockView.normalGestureNodeImage = [UIImage imageNamed:@"333.png"];
    self.lockView.selectedGestureNodeImage = [UIImage imageNamed:@"222.png"];
    self.lockView.lineColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.2];
    self.lockView.lineWidth = 3;
    self.lockView.delegate = self;
    self.lockView.contentInsets = UIEdgeInsetsMake(0, 30, 100, 20);
    self.instalation_Label.hidden = YES;
    [self.cancelButton addTarget:self action:@selector(cancelButtonPresed:)
     forControlEvents:UIControlEventTouchUpInside];
}


-(void)reset{
    self.installationLabel.hidden = NO;
    self.installationLabel.text = @"Set New Password";
    self.buttonView.hidden = YES;
    self.cancelButton.hidden = YES;
    self.setPassword.hidden = YES;
    self.instalation_Label.hidden = YES;
    _buttonSHow = NO;
}

- (IBAction)setPasswordButton:(id)sender {
    self.setPassword.hidden = YES;
    self.cancelButton.hidden = NO;
    self.installationLabel.hidden = NO;
    self.installationLabel.text = @"Get old Password";
    _buttonSHow = YES;
}

-(void)cancelButtonPresed:(NSString*)string{
    if (string != nil) {
        [self reset];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gestureLockView:(LockView *)gestureLockView didBeginWithPasscode:(NSString *)passcode{
    NSLog(@"%@",passcode);
}

- (void)gestureLockView:(LockView *)gestureLockView didEndWithPasscode:(NSString *)passcode{
    NSLog(@"%@",passcode);
    
    
    if (!_buttonSHow) {
        
        NSString *labelString = [self.lockModel getInstalationLabelTextWithKey:passcode];
        self.setPassword.hidden = NO;
        self.buttonView.hidden = NO;
        self.installationLabel.hidden = NO;
        self.installationLabel.text = labelString;
        self.instalation_Label.hidden = YES;
        
    }else if(_buttonSHow){
        self.instalation_Label.hidden = NO;
        NSString *labelString = (NSString*)[self.lockModel getInstalation_LabelTextWithKey:passcode];
        self.installationLabel.text = labelString;
        self.instalation_Label.hidden = YES;
        if ([self.lockModel unlocked:labelString]) {
            self.setPassword.hidden = YES;
            self.buttonView.hidden = YES;
            self.cancelButton.hidden = YES;
            self.instalation_Label.hidden = NO;
            self.instalation_Label.text = @"Set New  Gesture Password";
            _buttonSHow = NO;
            self.setPassword.hidden = NO;

        }
        self.setPassword.hidden = YES;
    }
}




@end
